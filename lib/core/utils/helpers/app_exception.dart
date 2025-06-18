class TAppException implements Exception {
  final String message;
  final String? code;

  TAppException(this.message, {this.code});

  @override
  String toString() {
    return message;
  }
}