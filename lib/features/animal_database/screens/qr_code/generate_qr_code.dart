import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/domain/repositories/local/file_repository.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/generate_qr_button.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  const QrCodeGeneratorScreen({super.key});

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
  final GlobalKey _key = GlobalKey();
  late QrImage _qrImage;
  String? _objectId;
  String? _name;

  @override
  void initState(){
    super.initState();
    final args = Get.arguments;
    _objectId = args["remoteId"];
    _name = args["name"];
    if(_objectId == null){
      return;
    }
    final qrCode = QrCode(
      8, QrErrorCorrectLevel.H
    )..addData(_objectId!); 

    _qrImage = QrImage(qrCode);
    
  }

  Future<String?> _saveQRCode() async{
    final data = await LocalFileRepository.capture(_key);
    if(data == null){
      throw Exception("Failed to convert qr code to uint8intlist");
    }
    final response = await LocalFileRepository.saveQrCode(data, _name!);
    TLogger.debug(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.paddingmd),
            child: _objectId == null
            ? const Placeholder()
            :Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RepaintBoundary(
                  key: _key,
                  child: PrettyQrView(
                  qrImage: _qrImage,
                    decoration:  PrettyQrDecoration(
                      image: const PrettyQrDecorationImage(
                        image:AssetImage(TImages.logoPawslinkRoundColored)
                      ).copyWith(scale: 0.4),
                      quietZone: PrettyQrQuietZone.standart,
                      shape:const PrettyQrSmoothSymbol(
                        color: PrettyQrBrush.gradient(
                          gradient: LinearGradient(
                            colors: [TColors.primary, TColors.tertiary]
                          )
                        ), // fallback if shader fails
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: SaveQRButton(asyncFunction: _saveQRCode),
                )
              ],
            )
          )
        )
      ),
    );
  }
}


