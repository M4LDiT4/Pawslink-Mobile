import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/img_picker_src_selection_button.dart';

///@widget GenericImagePicker
///@description : widget for picking and capturing images
///@notes : local states are managed by a stateful widget

class GenericImagePicker extends StatefulWidget {
  const GenericImagePicker({super.key});

  @override
  State<GenericImagePicker> createState() => _GenericImagePickerState();
}

class _GenericImagePickerState extends State<GenericImagePicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

Future<void> pickImage(ImageSource source) async {
  try {
    final XFile? photo = await _picker.pickImage(source: source);

    if (photo != null) {
      setState(() {
        _selectedImage = photo;
      });
    }
  } catch (e) {
    debugPrint('Image pick failed: $e');
    TUIHelpers.showSnackBar("Camera permission denied");
    // Optionally show a dialog/snackbar to inform user
  }
}

  Widget _renderPickerContent(bool isDarkMode){
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        color: isDarkMode
            ? TColors.backgroundDark
            : TColors.backgroundLight,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.paddingsm),
          child: Column(
            children: [
              if (_selectedImage != null)
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(_selectedImage!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: const Icon(Icons.close, size: 16, color: Colors.white),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              else ...[
                Icon(
                  size: 54,
                  color: isDarkMode
                      ? TColors.primaryDark
                      : TColors.primary,
                  Iconsax.gallery,
                ),
                const Text(TText.noImgSelected)
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.paddingmd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(TText.imgPickerText1),
              _renderPickerContent(isDarkMode),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImgPickerSrcSelectionBttn(
                    icon: Iconsax.camera,
                    handlePress: () => pickImage(ImageSource.camera),
                  ),
                  ImgPickerSrcSelectionBttn(
                    icon: Iconsax.gallery,
                    handlePress: () => pickImage(ImageSource.gallery),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Permission {
}
