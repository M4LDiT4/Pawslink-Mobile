import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/widgets/buttons/secondary_elevated_button.dart';
import 'package:mobile_app_template/core/widgets/image/aspectratio_image.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class GenericImagePicker extends StatefulWidget {
  final GenericImgPickerController? controller;

  const GenericImagePicker({
    super.key,
    this.controller,
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
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _controller.selectedImage = File(pickedFile.path); // Triggers AnimatedBuilder
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
        Container(
          constraints: const BoxConstraints(minHeight: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final image = _controller.selectedImage;
              return image == null
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 60, color: Colors.grey),
                          SizedBox(height: 8),
                          Text("No image selected"),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        AspectRatioImage.file(
                          image,
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
                    );
            },
          ),
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
