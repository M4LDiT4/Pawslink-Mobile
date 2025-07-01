import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/analyze_image_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/pause_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/start_stop_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/switch_camera_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/toggle_flashlight_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/dialogs/box_fit_dialog.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/dialogs/detection_speed_dialog.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/scanned_barcode_label.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/scanner_error_widget.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/zoom_scale_slider_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

enum _PopupMenuItems {
  detectionSpeed,
  returnImage,
  invertImage,
  autoZoom,
  useBarcodeOverlay,
  boxFit,
  scanWindow,
}

/// Implementation of Mobile Scanner example with advanced configuration
class QRCodeScannerScreen extends StatefulWidget {
  /// Constructor for advanced Mobile Scanner example
  const QRCodeScannerScreen({super.key});

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreen();
}

class _QRCodeScannerScreen extends State<QRCodeScannerScreen> {
  MobileScannerController? controller;

  // A scan window does work on web, but not the overlay to preview the scan
  // window. This is why we disable it here for web examples.
  bool useScanWindow = !kIsWeb;

  bool autoZoom = false;
  bool invertImage = false;
  bool returnImage = false;

  Size desiredCameraResolution = const Size(1920, 1080);
  DetectionSpeed detectionSpeed = DetectionSpeed.unrestricted;
  int detectionTimeoutMs = 1000;

  bool useBarcodeOverlay = true;
  BoxFit boxFit = BoxFit.cover;
  bool enableLifecycle = false;

  /// Hides the MobileScanner widget while the MobileScannerController is
  /// rebuilding
  bool hideMobileScannerWidget = false;

  MobileScannerController initController() => MobileScannerController(
    autoStart: false,
    cameraResolution: desiredCameraResolution,
    detectionSpeed: detectionSpeed,
    detectionTimeoutMs: 1000,
    formats: [BarcodeFormat.qrCode],
    returnImage: returnImage,
    invertImage: invertImage,
    autoZoom: autoZoom,
  );

  @override
  void initState() {
    super.initState();
    controller = initController();
    unawaited(controller!.start());
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller?.dispose();
    controller = null;
  }
  Future<void> _showDetectionSpeedDialog() async {
    final DetectionSpeed? result = await showDialog<DetectionSpeed>(
      context: context,
      builder: (context) => DetectionSpeedDialog(selectedSpeed: detectionSpeed),
    );

    if (result != null) {
      setState(() {
        detectionSpeed = result;
      });
    }
  }

  Future<void> _showBoxFitDialog() async {
    final BoxFit? result = await showDialog<BoxFit>(
      context: context,
      builder: (context) => BoxFitDialog(selectedBoxFit: boxFit),
    );

    if (result != null) {
      setState(() {
        boxFit = result;
      });
    }
  }

  /// This implementation fully disposes and reinitializes the
  /// MobileScannerController every time a setting is changed via the menu.
  ///
  /// This is NOT optimized for production use.
  /// Replacing the controller like this should not happen when MobileScanner is
  /// active. It causes a short visible flicker and can impact user experience.
  ///
  /// The settings should be defined once, or be configurable outside of a
  /// MobileScanner page, not while the MobileScanner is open.
  ///
  /// This is only used here to demonstrate dynamic configuration changes
  /// without restarting the whole app or navigating away from the scanner view.
  Future<void> _reinitializeController() async {
    // Hide the MobileScanner widget temporarily
    setState(() => hideMobileScannerWidget = true);

    // Let the UI settle
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // Dispose of the current controller safely
    await controller?.dispose();
    controller = null;

    // Create a new controller with updated configuration
    controller = initController();

    // Show the scanner again
    setState(() => hideMobileScannerWidget = false);
    await Future<void>.delayed(const Duration(milliseconds: 300));

    // Start scanning again
    await controller?.start();
  }

  @override
  Widget build(BuildContext context) {
    late final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(const Offset(0, -100)),
      width: 300,
      height: 300,
    );

    return Scaffold(
      appBar: GenericAppbar(
        actions: [
          PopupMenuButton<_PopupMenuItems>(
            tooltip: 'Menu',
            onSelected: (item) async {
              switch (item) {
                case _PopupMenuItems.detectionSpeed:
                  await _showDetectionSpeedDialog();
                case _PopupMenuItems.boxFit:
                  await _showBoxFitDialog();
                case _PopupMenuItems.returnImage:
                  returnImage = !returnImage;
                case _PopupMenuItems.invertImage:
                  invertImage = !invertImage;
                case _PopupMenuItems.autoZoom:
                  autoZoom = !autoZoom;
                case _PopupMenuItems.useBarcodeOverlay:
                  useBarcodeOverlay = !useBarcodeOverlay;
                case _PopupMenuItems.scanWindow:
                  useScanWindow = !useScanWindow;
              }

              // Rebuild and restart the controller with updated settings
              await _reinitializeController();
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: _PopupMenuItems.detectionSpeed,
                    child: Text(_PopupMenuItems.detectionSpeed.name),
                  ),
                  PopupMenuItem(
                    value: _PopupMenuItems.boxFit,
                    child: Text(_PopupMenuItems.boxFit.name),
                  ),
                  const PopupMenuDivider(),
                  if (!kIsWeb && Platform.isAndroid)
                    CheckedPopupMenuItem(
                      value: _PopupMenuItems.autoZoom,
                      checked: autoZoom,
                      child: Text(_PopupMenuItems.autoZoom.name),
                    ),
                  if (!kIsWeb && Platform.isAndroid)
                    CheckedPopupMenuItem(
                      value: _PopupMenuItems.invertImage,
                      checked: invertImage,
                      child: Text(_PopupMenuItems.invertImage.name),
                    ),
                  CheckedPopupMenuItem(
                    value: _PopupMenuItems.returnImage,
                    checked: returnImage,
                    child: Text(_PopupMenuItems.returnImage.name),
                  ),
                  CheckedPopupMenuItem(
                    value: _PopupMenuItems.useBarcodeOverlay,
                    checked: useBarcodeOverlay,
                    child: Text(_PopupMenuItems.useBarcodeOverlay.name),
                  ),
                  CheckedPopupMenuItem(
                    value: _PopupMenuItems.scanWindow,
                    checked: useScanWindow,
                    child: Text(_PopupMenuItems.scanWindow.name),
                  ),
                ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body:
          controller == null || hideMobileScannerWidget
              ? const Placeholder()
              : Stack(
                children: [
                  MobileScanner(
                    // useAppLifecycleState: false, // Only set to false if you want
                    // to handle lifecycle changes yourself
                    scanWindow: scanWindow,
                    controller: controller,
                    errorBuilder: (context, error) {
                      return ScannerErrorWidget(error: error);
                    },
                    fit: boxFit,
                  ),
                  if (useBarcodeOverlay)
                    BarcodeOverlay(controller: controller!, boxFit: boxFit),
                  // The scanWindow is not supported on the web.
                  if (useScanWindow)
                    ScanWindowOverlay(
                      scanWindow: scanWindow,
                      controller: controller!,
                    ),
                  //modify this
                  //the image should be on the center and ask the user if it is correct or not
                  //pause the scanner until the user has decided
                  //if it is not correct return the scanning
                  //else create an function to execute on success
                  if (returnImage)
                    Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: StreamBuilder<BarcodeCapture>(
                            stream: controller!.barcodes,
                            builder: (context, snapshot) {
                              final BarcodeCapture? barcode = snapshot.data;

                              if (barcode == null) {
                                return const Center(
                                  child: Text(
                                    'Your scanned barcode will appear here',
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }

                              final Uint8List? barcodeImage = barcode.image;

                              if (barcodeImage == null) {
                                return const Center(
                                  child: Text('No image for this barcode.'),
                                );
                              }

                              return Image.memory(
                                barcodeImage,
                                fit: BoxFit.cover,
                                gaplessPlayback: true,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Text(
                                      'Could not decode image bytes. $error',
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 200,
                      color: const Color.fromRGBO(0, 0, 0, 0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ScannedBarcodeLabel(
                              barcodes: controller!.barcodes,
                              handleOK: (){},
                              handledCancel: (){},
                            ),
                          ),
                          if (!kIsWeb) ZoomScaleSlider(controller: controller!),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ToggleFlashlightButton(controller: controller!),
                              StartStopButton(controller: controller!),
                              PauseButton(controller: controller!),
                              SwitchCameraButton(controller: controller!),
                              AnalyzeImageButton(controller: controller!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}