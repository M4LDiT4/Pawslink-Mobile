import 'package:file_magic_number/file_magic_number.dart';

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
      // Add more as needed
      default:
        return null;
    }
  }

  static bool isFileNameTextFile(String filename){
    final extension = filename.split('.').last.toLowerCase();
    return ['txt', 'md', 'csv', 'json', 'xml'].contains(extension);
  }
 
}