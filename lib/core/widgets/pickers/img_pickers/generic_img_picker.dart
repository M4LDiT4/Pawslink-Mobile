import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
    this.errMessage = 'Required',
  });

  @override
  State<GenericImagePicker> createState() => _GenericImagePickerState();
}

class _GenericImagePickerState extends State<GenericImagePicker> {
  final ImagePicker _picker = ImagePicker();
  late GenericImgPickerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? GenericImgPickerController()
      ..isRequired = widget.isRequired
      ..errorMessage = widget.errMessage;
  }

  /// Pick image from given source (Gallery/Camera)
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _controller.selectedImage = XFile(pickedFile.path);
    }
    if (mounted) Navigator.pop(context);
  }

  /// Show bottom sheet for choosing image source
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
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
      ),
    );
  }

  /// Remove currently selected image
  void _removeImage() => _controller.clearImage();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final theme = Theme.of(context);

        return Column(
          children: [
            // --- Display area ---
            if (_controller.selectedImage == null)
              // No image: show placeholder icon + optional error text
              _buildEmptyState(theme)
            else
              // Show selected image with a remove button
              _buildImagePreview(),

            const FixedSeparator(space: 12),

            // --- Action button ---
            SecondaryElevatedButton(
              onPressed: _showImageSourceDialog,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload),
                  const SizedBox(width: 8),
                  Text(
                    _controller.selectedImage == null
                        ? "Choose a photo"
                        : "Change photo",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /// UI shown when no image is selected
  Widget _buildEmptyState(ThemeData theme) {
    final hasError = _controller.status == WidgetStatus.error;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Iconsax.gallery,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            Text(
              hasError ? _controller.errorMessage : "No image selected",
              style: TextStyle(
                color: hasError
                    ? TColors.error
                    : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// UI shown when an image is selected
  Widget _buildImagePreview() {
    return Stack(
      children: [
        AspectRatioImage.file(
          File(_controller.selectedImage!.path),
          borderRadius: BorderRadius.circular(12),
        ),
        Positioned(
          top: 8,
          right: 8,
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
  }
}
