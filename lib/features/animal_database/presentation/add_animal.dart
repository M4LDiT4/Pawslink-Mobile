import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/camera/generic_camera.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/img_picker_src_selection_button.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

  void gotoCameraScreen () async{
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    TNavigationService.to(GenericCameraScreen(camera: firstCamera));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Scaffold(
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.paddingmd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Give your friend a Profile Picture"),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color: isDarkMode? TColors.backgroundDark: TColors.backgroundLight,
                            child: Padding(
                              padding: const EdgeInsets.all(TSizes.paddingsm),
                              child: Column(
                                children: [
                                  Icon(
                                    size: 54,
                                    color: isDarkMode? TColors.primaryDark : TColors.primary,
                                    Iconsax.gallery,
                                  ),
                                  const Text("No image selected")
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ImgPickerSrcSelectionBttn(
                              icon: Iconsax.camera, 
                              handlePress: gotoCameraScreen
                            ),
                            ImgPickerSrcSelectionBttn(
                              icon: Iconsax.gallery, 
                              handlePress: (){}
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

