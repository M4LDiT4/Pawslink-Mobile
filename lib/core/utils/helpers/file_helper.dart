import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class TFileHelpers {
  TFileHelpers._();
  ///function saveQRCode
  ///@description method to download and save generated qr codes
  ///@param key - the key that is referenced in the RepaintBoundary widget
  ///@param filename - preferably the name of the animal as label
  ///@param filename - if not used in saving non animal related qr codes, give the desired filename
  ///
  static Future<String?> saveQRCode(GlobalKey key, String filename) async {
    try {
      // Capture QR code as image
      RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to gallery
      final Directory dowloadsDir = Directory('/storage/emulated/0/Download');

      if(!dowloadsDir.existsSync()){ //check if the download folder exists
        throw TAppException("download folder not found");
      }

      final Directory qrCodesDir = Directory('${dowloadsDir.path}/qr_codes');

      if(!qrCodesDir.existsSync()){
        await qrCodesDir.create(recursive: true);
      }

      final filePath = '${qrCodesDir.path}/$filename${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      return filePath;
    } catch (e) {
      TLogger.error(e.toString());
      rethrow;
    }
  }
}
