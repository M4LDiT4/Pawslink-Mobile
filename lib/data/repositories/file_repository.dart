/// ***Notes***
// iOS Public storage support not implemented yet.
// Consider using `getApplicationDocumentsDirectory()` or `NSDocumentDirectory`

import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as p;

import 'package:file_magic_number/file_magic_number.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/file/file_utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
  /// @throws Exception if the directory cannot be created or accessed
  Future<Directory> _getDirectory(bool isPublic) async{
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
      final dir = await getApplicationCacheDirectory(); //double check this one
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
  String _buildPath(Directory dir, List<String> folders, String filename) {
    return p.join(dir.path, folders.join('/'), filename);
  }

  //write any type Unt8List data to file
  //if filename is null, use current timestamp as filename
  //if isPublic is true, save to public storage, otherwise save to app cache directory
  //folders is a list of subfolders to create in the directory
  //if folders is empty, save to the root of the directory
  Future<void> saveFile(String? filename, Uint8List data, {bool isPublic = false, List<String> folders = const []}) async{
    final fileType = FileMagicNumber.detectFileTypeFromBytes(data);
    final extension = TFileUtility.fileExtensionFromMagic(fileType);
    if(fileType == FileMagicNumberType.unknown || fileType == FileMagicNumberType.emptyFile){
      throw const FormatException('Cannot detect file type from data');
    }
    final dir = await _getDirectory(isPublic);

    final actualFilename = '${filename ?? DateTime.now().millisecondsSinceEpoch}.$extension';
    final filePath = _buildPath(dir, folders, actualFilename);

    final file = File(filePath);

    await file.writeAsBytes(data);
  }

  //write text based file
  //if filename is null, use current timestamp as filename with .txt extension
  //if isPublic is true, save to public storage, otherwise save to app cache directory
  //folders is a list of subfolders to create in the directory
  //if folders is empty, save to the root of the directory
  Future<void> saveTextBasedFile(String? filename, String data, {bool isPublic =false, List<String> folders = const []}) async {
    if(filename != null && !TFileUtility.isFileNameTextFile(filename)){
      throw const FormatException('Filename does not match text file format');
    }
    final actualFilename = filename ?? '${DateTime.now().millisecondsSinceEpoch}.txt'; // default to txt if no filename is provided
    final dir = await _getDirectory(isPublic);
    final filePath = _buildPath(dir, folders, actualFilename);

    final file = File(filePath);
    await file.writeAsString(data);
  }

  // Retrieves a file as a Uint8List from the specified path
  // If the file does not exist, it will return null
  // If the file exists, it will return the file data as a Uint8List
  Future<Uint8List?> getFileAsBytes(String path) async {
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
  Future<File?> getFile(String path) async {
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
  Future<void> updateFile(String path, Uint8List data) async {
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
  Future<void> updateStringFile(String path, String data) async{
    final file = File(path);

    if(!await file.exists()){
      throw FileSystemException("File does not exist at the specified path: $path");
    }

    await file.writeAsString(data);
  }

  Future<void> deleteFile(String path) async {
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
  Future<void> renameFile(String oldPath, String newFileName) async {
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
  Future<void> copyFile(String sourceFilePath, String destinationFilePath) async {
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
  Future<void> moveFile(String sourceFilePath, String destinationFilePath) async {
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
}
