import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';

/// ## ConnectionController
/// Keeps track of the internet connection status of the application
class ConnectionController extends GetxController {
  late final RxBool _hasInternetConnection;
  late final InternetConnectionChecker _internetConnectionChecker;
  //subscription for internet connection status 
  late final StreamSubscription<InternetConnectionStatus> _connectionStatusSubscription;
  //you can add subscription to changes in connection types to track changes in connection (e.g. wifi to mobile or none) _hasInternetConnection.value = hasInternetConnection.obs;

  Future<void> init() async{
    final connected =await TDeviceUtils.hasInternetConnection();
    _hasInternetConnection = connected.obs;
  }

  @override
  void onInit(){
    _setupConnectionController();    
    super.onInit();
  }

  void _setupConnectionController() async{
    _internetConnectionChecker = InternetConnectionChecker.instance;
    _internetConnectionListener();
  }

  ///attach a listener to the internet connection status
  void _internetConnectionListener() {
    _connectionStatusSubscription = _internetConnectionChecker.onStatusChange.listen((InternetConnectionStatus status){
      if(status == InternetConnectionStatus.connected){
        _hasInternetConnection.value = true;
        TUIHelpers.showStateSnackBar("You are online", state: SnackBarState.success);
      }else{
        _hasInternetConnection.value = false;
        TUIHelpers.showStateSnackBar("You are offline", state: SnackBarState.neutral);
      }
    });
  }

  @override
  void onClose(){
    _connectionStatusSubscription.cancel();
    _internetConnectionChecker.dispose();
    super.onClose();
  }

  /// checks if device is connected to the internet
  bool get isConnected{
    return _hasInternetConnection.value;
  }
}