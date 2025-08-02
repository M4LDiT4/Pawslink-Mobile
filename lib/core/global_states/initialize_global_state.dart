import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/internet_connection/connection_controller.dart';
/// ## initializeGlobalStates
/// Author: Jonathan Calugas
/// 
/// Setup initial app-wide states
/// - internet connection listener
Future<void> initializeGlobalStates() async{
  final connectionController = ConnectionController();
  await connectionController.init();
  Get.put(connectionController);
}