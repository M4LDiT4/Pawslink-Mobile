import 'dart:io';
import 'dart:isolate';
import 'package:file_magic_number/file_magic_number.dart';
import 'package:mobile_app_template/core/utils/file/file_load_request.dart';
import 'package:mobile_app_template/core/utils/file/file_load_response.dart';





class TFileUtility {
  static String? fileExtensionFromMagic(FileMagicNumberType type) {
    switch (type) {
      case FileMagicNumberType.png:
        return 'png';
      case FileMagicNumberType.jpg:
        return 'jpg';
      case FileMagicNumberType.pdf:
        return 'pdf';
      case FileMagicNumberType.mp4:
        return 'mp4';
      case FileMagicNumberType.gif:
        return 'gif';
      case FileMagicNumberType.mp3:
        return 'mp3';
      case FileMagicNumberType.zip:
        return 'zip';
      case FileMagicNumberType.rar:
        return 'rar';
      default:
        return null;
    }
  }

  static bool isFileNameTextFile(String filename) {
    final extension = filename.split('.').last.toLowerCase();
    return ['txt', 'md', 'csv', 'json', 'xml'].contains(extension);
  }

  static Future<void> _readFileForMultipart(FileLoadRequest request) async {
    try {
      final fileBytes = await File(request.filePath).readAsBytes();
      request.sendPort.send(FileLoadResponse(
        bytes: fileBytes,
        fieldName: request.fieldName,
        fileName: request.filePath.split('/').last,
      ));
    } catch (e) {
      request.sendPort.send(FileLoadResponse(
        error: e.toString(),
        fieldName: request.fieldName,
      ));
    }
  }

  /// Reads files as bytes and returns a [FileLoadResponse] that can be easily inserted in a [Map]
  /// ### Parameters
  /// - **[fieldName]**: [String] key of file/bytes when inserted in a file
  /// - **[filePath]**: [String] directory path of the file, file may or may not exist;
  /// ### Returns
  /// [FileLoadResponse] a JSON object that represents the read file and the key it will have when inserted in a [Map]
  static Future<FileLoadResponse> loadFileInIsolate(
    String fieldName,
    String filePath,
  ) async {
    final receivePort = ReceivePort();

    await Isolate.spawn(
      _readFileForMultipart,
      FileLoadRequest(
        sendPort: receivePort.sendPort,
        fieldName: fieldName,
        filePath: filePath,
      ),
    );

    final response = await receivePort.first as FileLoadResponse;
    receivePort.close();
    return response;
  }
}
