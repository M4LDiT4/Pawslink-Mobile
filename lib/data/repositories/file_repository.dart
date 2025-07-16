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

//this implementation is safe only for android
//in particualr, the given implementation does not support public storage for ios
//either create a strategy for ios or extend the current one to support it
class LocalFileRepository {
  LocalFileRepository._(); 
  // Retrieves the directory for saving files
  // If isPublic is true, it will save to public storage
  // If isPublic is false, it will save to app cache directory
  // If the directory does not exist, it will create it
  // Returns a Directory object for the specified path
  /// @param isPublic - if true, save to public storage, otherwise save to app cache directory
  /// 
  /// @param type - the type of storage to use (persistent, temporary, cache)
  /// 
  /// @returns a Directory object for the specified path
  /// 
  /// @throws Exception if the storage permission is not granted (for public storage)
  /// 
  /// @throws Exception if the directory cannot be created or accessed
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
  // Builds the full path for the file to be saved
  // If folders is empty, it will save to the root of the directory
  // If folders is not empty, it will create the subfolders in the directory
  // Returns the full path as a string
  /// @param dir - the directory where the file will be saved
  /// @param folders - a list of subfolders to create in the directory
  /// @param filename - the name of the file to be saved
  /// @returns the full path as a string
  static String _buildPath(Directory dir, List<String> folders, String filename) {
    return p.join(dir.path, folders.join('/'), filename);
  }

  //write any type Unt8List data to file
  //if filename is null, use current timestamp as filename
  //if isPublic is true, save to public storage, otherwise save to app cache directory
  //folders is a list of subfolders to create in the directory
  //if folders is empty, save to the root of the directory
  /// @param filename - the name of the file to be saved, if null, current timestamp will be used
  /// 
  /// @param data - the data to be saved in the file as a Uint8List
  /// @param isPublic - if true, save to public storage, otherwise save to app cache directory
  /// 
  /// @param folders - a list of subfolders to create in the directory, defaults to an empty list
  /// 
  /// @param type - the type of storage to use (persistent, temporary, cache), defaults to persistent
  /// 
  /// @throws FormatException if the file type cannot be detected from the data
  /// 
  /// @throws Exception if the directory cannot be created or accessed
  /// 
  /// @returns a Future which completes with the File object of the saved file
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
    final filePath = _buildPath(dir, folders, actualFilename);

    final file = File(filePath);

    await file.writeAsBytes(data);
    return file;
  }

  //write text based file
  //if filename is null, use current timestamp as filename with .txt extension
  //if isPublic is true, save to public storage, otherwise save to app cache directory
  //folders is a list of subfolders to create in the directory
  //if folders is empty, save to the root of the directory
  /// @param filename - the name of the file to be saved, if null, current timestamp will be used with .txt extension
  /// @param data - the text data to be saved in the file
  /// @param isPublic - if true, save to public storage, otherwise save to app cache directory
  /// @param folders - a list of subfolders to create in the directory, defaults to an empty list
  /// @param type - the type of storage to use (persistent, temporary, cache), defaults to persistent
  /// @throws FormatException if the filename does not match the text file format
  /// @throws Exception if the directory cannot be created or accessed
  /// @returns a Future which completes with the File object of the saved file
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
    final filePath = _buildPath(dir, folders, actualFilename);

    final file = File(filePath);
    await file.writeAsString(data);
    return file;
  }

  // Retrieves a file as a Uint8List from the specified path
  // If the file does not exist, it will return null
  // If the file exists, it will return the file data as a Uint8List
  /// @param path - the path to the file to be retrieved
  /// @returns a Future that completes with the file data as a Uint8List, or null if the file does not exist
  /// @throws Exception if the file cannot be read
  /// @throws FileSystemException if the file does not exist at the specified path
  static Future<Uint8List?> getFileAsBytes(String path) async {
    final file = File(path);
    if (!await file.exists()){
      return null;
    }
    final data = await file.readAsBytes();
    return data;
  }

  // Retrieves a file as a Uint8List from the specified path
  // If the file does not exist, it will return null
  // If the file exists, it will return the file data as a Uint8List  
  /// @param path - the path to the file to be retrieved
  /// @returns a Future that completes with the file data as a Uint8List, or null if the file does not exist
  /// @throws Exception if the file cannot be read
  /// @throws FileSystemException if the file does not exist at the specified path
  static Future<File?> getFile(String path) async {
    final file = File(path);
    if(await file.exists()){
      return file;
    }
    return null;
  }

  // Updates a file at the specified path with new data
  // If the file does not exist, it will throw an exception
  // The file will be updated with the new data, overwriting the existing content
  // The data should be a valid Uint8List
  // If the data is not valid, it will throw an exception
  /// @param path - the path to the file to be updated
  /// @param data - the new data to be written to the file as a Uint8List
  /// @throws FileSystemException if the file does not exist at the specified path
  /// @throws Exception if the file cannot be written
  /// @returns a Future that completes when the file is updated
  static Future<void> updateFile(String path, Uint8List data) async {
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }
    await file.writeAsBytes(data);
  }

  // Updates a text file at the specified path with new data
  // If the file does not exist, it will throw an exception
  // If the data is not a valid string, it will throw an exception
  // The file will be updated with the new data, overwriting the existing content 
  /// @param path - the path to the file to be updated
  /// @param data - the new data to be written to the file as a String
  /// @throws FileSystemException if the file does not exist at the specified path
  /// @throws Exception if the file cannot be written
  /// @returns a Future that completes when the file is updated
  static Future<void> updateStringFile(String path, String data) async{
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }

    await file.writeAsString(data);
  }

  static Future<void> deleteFile(String path) async {
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }
    await file.delete();
  }
  // Renames a file at the specified path to a new file name
  // If the file does not exist, it will throw an exception
  // If the new file name is not valid, it will throw an exception
  // The new file name should not include the path, only the file name
  // The file will be renamed in the same directory it currently exists
  /// @param oldPath - the current path of the file to be renamed
  /// @param newFileName - the new name for the file, should not include the path
  /// @throws FileSystemException if the file does not exist at the specified path
  /// @throws Exception if the file cannot be renamed
  /// @returns a Future that completes when the file is renamed
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

  // Copies a file from one location to another
  // If the destination directory does not exist, it will be created
  // If the source file does not exist, it will throw an exception
  /// @param sourceFilePath - the path to the source file to be copied
  /// @param destinationFilePath - the path where the file will be copied to
  /// @throws FileSystemException if the source file does not exist at the specified path
  /// @throws Exception if the destination directory cannot be created or accessed
  /// @returns a Future that completes when the file is copied
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

  // Moves a file from one location to another
  // If the destination directory does not exist, it will be created
  // If the source file does not exist, it will throw an exception
  /// @param sourceFilePath - the path to the source file to be moved
  /// @param destinationFilePath - the path where the file will be moved to
  /// @throws FileSystemException if the source file does not exist at the specified path
  /// @throws Exception if the destination directory cannot be created or accessed
  /// @returns a Future that completes when the file is moved
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
  
  // find and delete file
  /// @param file -the file to find and delete
  /// @return a Future that completes when the file is not found or is deleted
  static Future<void> findAndDelete(File file) async {
    final foundFile = await getFile(file.path);
    if(foundFile == null || !await foundFile.exists()){
      return; //no need to delete since file is not found
    }

    await deleteFile(file.path); //delete file if file is found
  }
}
