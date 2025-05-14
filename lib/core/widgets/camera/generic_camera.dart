import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/camera/preview_picture_screen.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class GenericCameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const GenericCameraScreen({
    super.key,
    required this.camera
  });

  @override
  State<GenericCameraScreen> createState() => _GenericCameraScreenState();
}

class _GenericCameraScreenState extends State<GenericCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  void handleCapture()async{
    try{
      await _initializeControllerFuture;

      final image = await _controller.takePicture();

      if(!context.mounted){
        return;
      }

      TNavigationService.to(PreviewPictureScreen(
        imgPath: image.path,
      ));
    }catch(err){
      TLogger.error(err.toString());
    }
  }

  @override
  void dispose (){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture, 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          }else{
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleCapture,
        child: const Icon(Iconsax.camera),
      ),
    );
  }
}

