import 'dart:typed_data';

class FileLoadResponse {
  final Uint8List? bytes;
  final String? fieldName;
  final String? fileName;
  final String? error;

  FileLoadResponse({
    this.bytes,
    this.fieldName,
    this.fileName,
    this.error,
  });
}