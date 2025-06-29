import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGeneratorScreen extends StatefulWidget {
  const QrCodeGeneratorScreen({super.key});

  @override
  State<QrCodeGeneratorScreen> createState() => _QrCodeGeneratorScreenState();
}

class _QrCodeGeneratorScreenState extends State<QrCodeGeneratorScreen> {

  late QrImage _qrImage;

  @override
  void initState(){
    super.initState();
    final qrCode = QrCode(
      8, QrErrorCorrectLevel.H
    )..addData("This is my data");

    _qrImage = QrImage(qrCode);
    
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
                PrettyQrView(
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
                ElevatedButton(
                  onPressed: (){}, 
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download),
                      Text("Download QR Code")
                    ],
                  )
                )
              ],
            )
          )
        )
      ),
    );
  }
}