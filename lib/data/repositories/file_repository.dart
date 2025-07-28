/// ***Notes***
// iOS Public storage support not implemented yet.
// Consider using `getApplicationDocumentsDirectory()` or `NSDocumentDirectory`

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

import 'package:file_magic_number/file_magic_number.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/file/file_utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

enum FileStorageType {persistent, temporary, cache}
/// ## LocalFileRepository
/// 
/// A utility class for managing local file operations on Android and iOS.
/// 
/// ### Features:
/// - Create files (binary and text)
/// - Read files as `File` or `Uint8List`
/// - Update file contents
/// - Rename, copy, move, and delete files
/// - Support for both public and app-specific storage
/// 
/// > ⚠️ Public storage support is currently implemented only for Android.
/// 
/// ### App Storage Types:
/// - `persistent`: Saved across app restarts
/// - `temporary`: Removed automatically by OS
/// - `cache`: Safe to delete, for non-essential temporary data

class LocalFileRepository {
  LocalFileRepository._(); //private constructor

  /// Resolves the storage directory based on privacy and type.
  /// 
  /// - Checks platform compatibility (only Android supports public directories)
  /// - Requests storage permission if needed
  /// - Returns a platform-appropriate directory
  /// 
  /// **Parameters:**
  /// - `isPublic`: Whether to access a public (shared) directory
  /// - `type`: Type of app-specific storage (`persistent`, `temporary`, `cache`)
  /// 
  /// **Returns:** The resolved [Directory]
  /// 
  /// **Throws:**
  /// - [Exception] if permission is denied or unsupported platform
  static Future<Directory> _getDirectory(bool isPublic , FileStorageType type) async{
    if(isPublic){
      if(TDeviceUtils.isAndroid()){
        final status = await Permission.storage.request();
        if(!status.isGranted){
          throw Exception('Storage permission not granted');
        }
        final externalDir = Directory('/storage/emulated/0/Download/pawslink_files');// Default to Download directory for public files
        if(!await externalDir.exists()){
          await externalDir.create(recursive: true);
        }

        return externalDir;
      }else{
        throw Exception('Public storage not supported on this platform');
      }
    }else{
      Directory dir;
      if(type == FileStorageType.temporary){
        dir = await getTemporaryDirectory(); //this is for temporary storage
        return dir;
      }else if(type == FileStorageType.cache){
        dir = await getApplicationCacheDirectory();
        return dir;
      }
      else{
        dir = await getApplicationDocumentsDirectory(); //this is for persistent storage
      } //this is for cache storage
      final targetDir = Directory('${dir.path}/pawslink_files');
      if(!await targetDir.exists()){
        await targetDir.create(recursive: true);
      }
      return targetDir;
    }
  }

  /// Constructs a file path from a directory and nested folder structure.
  /// 
  /// - Ensures intermediate folders exist
  /// - Joins the path safely using the `path` package
  /// 
  /// **Parameters:**
  /// - `dir`: Base directory
  /// - `folders`: Folder segments leading to the file
  /// - `filename`: Name of the file
  /// 
  /// **Returns:** The final path to the file as [String]

  static Future<String> _buildPath(Directory dir, List<String> folders, String filename) async{
    final foldername = Directory(p.join(dir.path, folders.join('/')));
    if(!await foldername.exists()){
      foldername.create(recursive: true);
    }
    return p.join(foldername.path, filename);
  }

  /// Saves binary data (e.g. image, video) to local storage.
  /// 
  /// - Detects file type using magic number
  /// - Saves to public or app-specific directory
  /// - Generates filename if not provided
  /// 
  /// **Parameters:**
  /// - `filename`: Optional filename (auto-generated if null)
  /// - `data`: File contents
  /// - `isPublic`: Save to public directory if `true` (Android only)
  /// - `folders`: Path subfolders under root directory
  /// - `type`: Type of in-app storage (`persistent`, `temporary`, `cache`)
  /// 
  /// **Returns:** A [File] object of the saved file
  /// 
  /// **Throws:** [FormatException] if file type can't be detected
  static Future<File> saveFile(
    String? filename, 
    Uint8List data, 
    {
      bool isPublic = false, 
      List<String> folders = const [],
      FileStorageType type = FileStorageType.persistent
    }
  ) async{
    final fileType = FileMagicNumber.detectFileTypeFromBytes(data);
    final extension = TFileUtility.fileExtensionFromMagic(fileType);
    if(fileType == FileMagicNumberType.unknown || fileType == FileMagicNumberType.emptyFile){
      throw const FormatException('Cannot detect file type from data');
    }
    final dir = await _getDirectory(isPublic, type);

    final actualFilename = '${filename ?? DateTime.now().millisecondsSinceEpoch}.$extension';
    final filePath = await _buildPath(dir, folders, actualFilename);

    final file = File(filePath);

    await file.writeAsBytes(data);
    return file;
  }

  /// Saves a text file (e.g. `.txt`, `.json`) from a [String].
  /// 
  /// - Validates extension (must be text-based)
  /// - Uses UTF-8 to encode text
  /// 
  /// **Parameters:**
  /// - `filename`: Optional text filename (auto-generates `.txt` if null)
  /// - `data`: Text content to write
  /// - `isPublic`: Whether to store in public storage
  /// - `folders`: Subfolders for destination
  /// - `type`: Storage type for app directory
  /// 
  /// **Returns:** [File] object of the saved file
  /// 
  /// **Throws:** [FormatException] if extension isn't recognized as text
  static Future<File> saveTextBasedFile(
    String? filename, 
    String data, 
    {
      bool isPublic =false, 
      List<String> folders = const [],
      FileStorageType type = FileStorageType.persistent
    }
  ) async {
    if(filename != null && !TFileUtility.isFileNameTextFile(filename)){
      throw const FormatException('Filename does not match text file format');
    }
    final actualFilename = filename ?? '${DateTime.now().millisecondsSinceEpoch}.txt'; // default to txt if no filename is provided
    final dir = await _getDirectory(isPublic, type);
    final filePath = await _buildPath(dir, folders, actualFilename);

    final file = File(filePath);
    await file.writeAsString(data);
    return file;
  }
  /// Reads a file as [Uint8List] from its path.
  /// 
  /// **Returns:** File contents or `null` if file doesn't exist

  static Future<Uint8List?> getFileAsBytes(String path) async {
    final file = File(path);
    if (!await file.exists()){
      return null;
    }
    final data = await file.readAsBytes();
    return data;
  }
  /// Retrieves a file from a given path.
  /// 
  /// **Returns:** A [File] if found, or `null` otherwise
  static Future<File?> getFile(String path) async {
    final file = File(path);
    if(await file.exists()){
      return file;
    }
    return null;
  }

  /// Updates a file's binary contents with new [Uint8List] data.
  /// 
  /// **Throws:** [FileSystemException] if the file doesn't exist
  static Future<void> updateFile(String path, Uint8List data) async {
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }
    await file.writeAsBytes(data);
  }

  /// Updates a text file's contents.
  /// 
  /// **Throws:** [FileSystemException] if the file doesn't exist
  static Future<void> updateStringFile(String path, String data) async{
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }

    await file.writeAsString(data);
  }
  /// Deletes a file at a given path.
  /// 
  /// **Throws:** [FileSystemException] if the file doesn't exist
  static Future<void> deleteFile(String path) async {
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }
    await file.delete();
  }
  /// Renames a file to a new name in the same directory.
  /// 
  /// **Throws:**
  /// - [FileSystemException] if file doesn't exist or rename fails
  static Future<void> renameFile(String oldPath, String newFileName) async {
    final oldFile = File(oldPath);
    if(!await oldFile.exists()){
      throw FileSystemException("File does not exist at the specified path: $oldPath");
    }
    final splitPath = oldPath.split('/');
    splitPath.removeLast(); // Remove the file name
    final newPath = '${splitPath.join('/')}/$newFileName';
    final newFile = await oldFile.rename(newPath);
    if(!await newFile.exists()){
      throw FileSystemException("Failed to rename file to: $newPath");
    }
  }

  /// Copies a file to a new location.
  /// 
  /// - Creates target folder if it doesn't exist
  /// 
  /// **Throws:**
  /// - [FileSystemException] if source doesn't exist
  /// - [Exception] on failure to create destination
  static Future<void> copyFile(String sourceFilePath, String destinationFilePath) async {
    final sourceFile = File(sourceFilePath);

    if(!await sourceFile.exists()){
      throw FileSystemException("Source file does not exist at the specified path: $sourceFilePath");
    }

    final folderList = destinationFilePath.split('/');
    folderList.removeLast(); // Remove the file name to get the directory path

    // Check if the destination directory is valid
    if(folderList.isEmpty || folderList.last.isEmpty){
      throw FileSystemException("Invalid destination file path: $destinationFilePath");
    }
    // Create the destination directory if it doesn't exist
    final destDir = Directory(folderList.join());
    if(!await destDir.exists()){
      destDir.create(recursive: true);
    }
    
    await sourceFile.copy(destinationFilePath);
  }

  /// Moves a file to a new path (copy + delete).
  /// 
  /// **Throws:**
  /// - [FileSystemException] if source file doesn't exist
  static Future<void> moveFile(String sourceFilePath, String destinationFilePath) async {
    final sourceFile = File(sourceFilePath);

    if(!await sourceFile.exists()){
      throw FileSystemException("Source file does not exist at the specified path: $sourceFilePath");
    }
    final folderList = destinationFilePath.split('/');
    folderList.removeLast(); // Remove the file name to get the directory path

    final destDir = Directory(folderList.join("/"));
    if(!await destDir.exists()){
      await destDir.create(recursive: true);
    }

    final destFile = File(destinationFilePath);

    await destFile.writeAsBytes(await sourceFile.readAsBytes());
    await sourceFile.delete();
  }
  
  /// Finds a file and deletes it if it exists.
  /// 
  /// - Safe no-op if file doesn't exist
  static Future<void> findAndDelete(File file) async {
    final foundFile = await getFile(file.path);
    if(foundFile == null || !await foundFile.exists()){
      return; //no need to delete since file is not found
    }

    await deleteFile(file.path); //delete file if file is found
  }
}
