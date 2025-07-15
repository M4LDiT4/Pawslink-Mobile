
import 'dart:io';
import 'dart:typed_data';

import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

//this implementation is safe only for android
//in particualr, the given implementation does not support public storage for ios
//either create a strategy for ios or extend the current one to support it
class LocalFileRepository {
  Future<Directory> _getDirectory(bool isPublic) async{
    if(isPublic){
      if(TDeviceUtils.isAndroid()){
        final status = await Permission.storage.request();
        if(!status.isGranted){
          throw Exception('Storage permission not granted');
        }

        final externalDir = Directory('/storage/emulated/0/Download/pawslink_files');
        if(!await externalDir.exists()){
          await externalDir.create(recursive: true);
        }

        return externalDir;
      }else{
        throw Exception('Public storage not supported on this platform');
      }
    }else{
      final dir = await getApplicationCacheDirectory();
      return Directory('${dir.path}/pawslink_files')
      ..createSync(recursive: true);
    }
  }

  String? _detectFileType(Uint8List data) {
    if (data.length < 4) return null;

    final header = data.sublist(0, 8);

    if (header[0] == 0xFF && header[1] == 0xD8) return 'jpg';
    if (header[0] == 0x89 && header[1] == 0x50 && header[2] == 0x4E && header[3] == 0x47) return 'png';
    if (header[0] == 0x47 && header[1] == 0x49 && header[2] == 0x46) return 'gif';
    if (header[0] == 0x25 && header[1] == 0x50 && header[2] == 0x44 && header[3] == 0x46) return 'pdf';
    if (header[0] == 0x42 && header[1] == 0x4D) return 'bmp';
    if (header[0] == 0x49 && header[1] == 0x44 && header[2] == 0x33) return 'mp3';
    if (header[0] == 0x50 && header[1] == 0x4B) return 'zip'; // could also be .docx, .xlsx, etc.

    return null; // unknown
  }

  Future<void> saveFile(String? filename, Uint8List data, {bool isPublic = false, List<String> folders = const []}) async{
    final fileType = _detectFileType(data);
    if(fileType == null){
      throw const FormatException('Cannot detect file type from data');
    }
    final dir = await _getDirectory(isPublic);

    final actualFilename = '${filename ?? DateTime.now().millisecondsSinceEpoch}.$fileType';
    final filePath = '${dir.path}/${folders.join('/')}/$actualFilename';

    final file = File(filePath);

    await file.writeAsBytes(data);
  }
}
