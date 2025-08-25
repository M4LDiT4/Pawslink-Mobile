import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/analyze_image_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/pause_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/start_stop_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/switch_camera_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/buttons/toggle_flashlight_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/dialogs/box_fit_dialog.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/dialogs/detection_speed_dialog.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/scanner_error_widget.dart';
import 'package:mobile_app_template/features/animal_database/widgets/scan_qr_code/zoom_scale_slider_widget.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';
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

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({super.key});

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  MobileScannerController? controller;
  late AnimalDatabaseService _service;

  // Scanner settings
  bool useScanWindow = !kIsWeb;
  bool autoZoom = false;
  bool invertImage = false;
  bool returnImage = false;
  bool useBarcodeOverlay = true;
  bool hideMobileScannerWidget = false;

  Size desiredCameraResolution = const Size(1920, 1080);
  DetectionSpeed detectionSpeed = DetectionSpeed.unrestricted;
  BoxFit boxFit = BoxFit.cover;

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
    _service = getIt<AnimalDatabaseService>();
    controller!.barcodes.listen((capture) {
      if(capture.barcodes.isNotEmpty){
        onQRCodeDetected(capture.barcodes);
      }
    });
    unawaited(controller!.start());
  }

  @override
  void dispose() {
    // Dispose your controller safely
    controller?.dispose();
    controller = null;

    // Always call super.dispose() at the end
    super.dispose();
  }

  Future<void> onQRCodeDetected(List<Barcode> barcode) async{
    await controller!.stop();
    for(int i =0; i < barcode.length; i++){
      final code = barcode[i].rawValue;
      if(code == null) continue;
      
      final response = await _service.getAnimalByBSONId(code);
      if(response.isSuccessful && response.data != null){
        TNavigationService.toNamed(TAppRoutes.viewAnimalDetails, arguments: response.data);
        return;
      }
    }
    TUIHelpers.showStateSnackBar(
      "QR Code detected but does not associated with animal",
      snackPosition: SnackPosition.TOP,
    );
    await controller!.start();
  }

  // -----------------------------
  // Dialogs
  // -----------------------------
  Future<void> _showDetectionSpeedDialog() async {
    final result = await showDialog<DetectionSpeed>(
      context: context,
      builder: (_) => DetectionSpeedDialog(selectedSpeed: detectionSpeed),
    );
    if (result != null) setState(() => detectionSpeed = result);
  }

  Future<void> _showBoxFitDialog() async {
    final result = await showDialog<BoxFit>(
      context: context,
      builder: (_) => BoxFitDialog(selectedBoxFit: boxFit),
    );
    if (result != null) setState(() => boxFit = result);
  }

  // -----------------------------
  // Reinitialize scanner controller
  // -----------------------------
  Future<void> _reinitializeController() async {
    setState(() => hideMobileScannerWidget = true);
    await Future.delayed(const Duration(milliseconds: 300));
    await controller?.dispose();
    controller = initController();
    setState(() => hideMobileScannerWidget = false);
    await Future.delayed(const Duration(milliseconds: 300));
    await controller?.start();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
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
              await _reinitializeController();
            },
            itemBuilder: (_) => _buildPopupMenuItems(),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: controller == null || hideMobileScannerWidget
          ? const Placeholder()
          : Stack(
              children: [
                MobileScanner(
                  scanWindow: scanWindow,
                  controller: controller,
                  errorBuilder: (context, error) =>
                      ScannerErrorWidget(error: error),
                  fit: boxFit,
                ),
                if (useBarcodeOverlay && controller != null)
                  BarcodeOverlay(controller: controller!, boxFit: boxFit),
                if (useScanWindow && controller != null)
                  ScanWindowOverlay(scanWindow: scanWindow, controller: controller!),
                _buildReturnImageOverlay(),
                _buildScannerControls(),
              ],
            ),
    );
  }

  // -----------------------------
  // Popup Menu Items
  // -----------------------------
  List<PopupMenuEntry<_PopupMenuItems>> _buildPopupMenuItems() {
    return [
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
        _checkedMenuItem(_PopupMenuItems.autoZoom, autoZoom),
      if (!kIsWeb && Platform.isAndroid)
        _checkedMenuItem(_PopupMenuItems.invertImage, invertImage),
      _checkedMenuItem(_PopupMenuItems.returnImage, returnImage),
      _checkedMenuItem(_PopupMenuItems.useBarcodeOverlay, useBarcodeOverlay),
      _checkedMenuItem(_PopupMenuItems.scanWindow, useScanWindow),
    ];
  }

  CheckedPopupMenuItem<_PopupMenuItems> _checkedMenuItem(
      _PopupMenuItems item, bool checked) {
    return CheckedPopupMenuItem(
      value: item,
      checked: checked,
      child: Text(item.name),
    );
  }

  // -----------------------------
  // Return Image Overlay
  // -----------------------------
  Widget _buildReturnImageOverlay() {
    if (!returnImage || controller == null) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 200,
          height: 200,
          child: StreamBuilder<BarcodeCapture>(
            stream: controller!.barcodes,
            builder: (context, snapshot) {
              final barcode = snapshot.data;
              if (barcode == null || barcode.image == null) {
                return const Center(
                  child: Text('No image yet.'),
                );
              }
              return Image.memory(
                barcode.image!,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                errorBuilder: (_, error, __) => Center(
                  child: Text('Could not decode image bytes: $error'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // -----------------------------
  // Scanner Controls
  // -----------------------------
  Widget _buildScannerControls() {
    if (controller == null) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200,
        color: const Color.fromRGBO(0, 0, 0, 0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!kIsWeb) ZoomScaleSlider(controller: controller!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleFlashlightButton(controller: controller!),
                StartStopButton(controller: controller!),
                PauseButton(controller: controller!),
                SwitchCameraButton(controller: controller!),
                AnalyzeImageButton(
                  controller: controller!,
                  onQRCodeDetected: onQRCodeDetected,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
