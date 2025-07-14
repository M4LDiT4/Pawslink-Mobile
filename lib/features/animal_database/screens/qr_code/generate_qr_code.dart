import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/helpers/file_helper.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/generate_qr_button.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  //pass the stringified object id here
  const QrCodeGeneratorScreen({super.key});

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {
  final GlobalKey _key = GlobalKey();
  late QrImage _qrImage;

  @override
  void initState(){
    super.initState();
    final qrCode = QrCode(
      8, QrErrorCorrectLevel.H
    )..addData("This is my data"); //replace this with actual object id

    _qrImage = QrImage(qrCode);
    
  }

  Future<String?> _saveQRCode() async{
    final response = await TFileHelpers.saveQRCode(_key, "name");
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
            child: Column(
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


