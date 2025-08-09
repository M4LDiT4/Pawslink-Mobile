import 'dart:isolate';

class FileLoadRequest {
  final SendPort sendPort;
  final String fieldName;
  final String filePath;

  FileLoadRequest({
    required this.sendPort,
    required this.fieldName,
    required this.filePath,
  });
}