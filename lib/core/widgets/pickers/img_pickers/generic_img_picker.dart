import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/img_picker_src_selection_button.dart';

///@widget GenericImagePicker
///@description : widget for picking and capturing images
///@notes : local states are managed by a stateful widget

class GenericImagePicker extends StatefulWidget {
  final GenericImgPickerController? controller;
  const GenericImagePicker({
    super.key,
    this.controller,
  });

  @override
  State<GenericImagePicker> createState() => _GenericImagePickerState();
}

class _GenericImagePickerState extends State<GenericImagePicker> {
  late GenericImgPickerController _controller;
  late ImagePicker _picker;

  @override
  void initState(){
    _controller = widget.controller ?? GenericImgPickerController();
    _picker = ImagePicker();
    super.initState();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? photo = await _picker.pickImage(source: source);

      if (photo != null) {
        _controller.selectedImage = photo;
      }
    } catch (e) {
      debugPrint('Image pick failed: $e');
      TUIHelpers.showSnackBar("Camera permission denied");
      // Optionally show a dialog/snackbar to inform user
    }
  }

  void resetPicker(){
    _controller.selectedImage = null;
  }

  Widget _renderPickerContent(){
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        color: TColorUtils.surface(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.paddingsm),
          child: AnimatedBuilder(
            animation: _controller, 
            builder: (context, _) =>Column(
            children: [
              if (_controller.selectedImage != null)
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(_controller.selectedImage!.path),
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
                          onPressed: resetPicker
                        ),
                      ),
                    ),
                  ],
                )
              else ...[
                Icon(
                  size: 54,
                  color: TColorUtils.primary(),
                  Iconsax.gallery,
                ),
                const Text(TText.noImgSelected)
              ]
            ],
          ),
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    Color iconColor = isDarkMode? TColors.primaryDark : TColors.primary;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.paddingmd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(TText.imgPickerText1),
            _renderPickerContent(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: TSizes.iconxl,
                  color: iconColor,
                  onPressed: () => pickImage(ImageSource.camera), 
                  icon: const Icon(Iconsax.camera)
                ),
                IconButton(
                  iconSize: TSizes.iconxl,
                  color: iconColor,
                  onPressed:() => pickImage(ImageSource.gallery),
                  icon: const Icon(Iconsax.gallery)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

