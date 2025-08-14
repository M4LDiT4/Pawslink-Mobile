class MultipartFileData {
  final String fieldName;
  final String filePath;
  final String? fileName;

  MultipartFileData({
    required this.fieldName,
    required this.filePath,
    this.fileName
  });
}