import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/widgets/buttons/secondary_elevated_button.dart';
import 'package:mobile_app_template/core/widgets/image/aspectratio_image.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class GenericImagePicker extends StatefulWidget {
  final GenericImgPickerController? controller;
  final bool isRequired;
  final String errMessage;

  const GenericImagePicker({
    super.key,
    this.controller,
    this.isRequired = false,
    this.errMessage = 'Required'
  });

  @override
  State<GenericImagePicker> createState() => _GenericImagePicker();
}

class _GenericImagePicker extends State<GenericImagePicker> {
  final ImagePicker _picker = ImagePicker();
  late GenericImgPickerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? GenericImgPickerController();
    _controller.isRequired = widget.isRequired;
    _controller.errorMessage = widget.errMessage;
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _controller.selectedImage = XFile(pickedFile.path); // Triggers AnimatedBuilder
    }

    if (!mounted) return;
    Navigator.pop(context); // Close the bottom sheet
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => _pickImage(ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeImage() {
    _controller.clearImage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller, 
          builder: (context, _){
            return Container(
          constraints: const BoxConstraints(minHeight: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
            border: Border.all(
              color: _controller.status == WidgetStatus.error? TColors.error : Colors.transparent,
              width: 2
            )
          ),
          child: _controller.selectedImage == null?
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.image, size: 60, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                    style: TextStyle(
                      color: _controller.status == WidgetStatus.error? TColors.error: TColors.textDark 
                    ),
                    _controller.status == WidgetStatus.error? _controller.errorMessage: "No image selected"
                  ),
                ],
              ),
            )
            : Stack(
                children: [
                  AspectRatioImage.file(
                    File(_controller.selectedImage!.path),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: _removeImage,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            );
          }
        ),
        const FixedSeparator(space: 8),
        SecondaryElevatedButton(
          onPressed: _showImageSourceDialog,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.upload),
              SizedBox(width: 8),
              Text("Choose a photo"),
            ],
          ),
        ),
      ],
    );
  }
}
