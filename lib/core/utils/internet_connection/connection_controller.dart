import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';

/// ## ConnectionController
/// Keeps track of the internet connection status of the application
class ConnectionController extends GetxController {
  late final RxBool _hasInternetConnection;
  late final InternetConnectionChecker _internetConnectionChecker;
  //subscription for internet connection status 
  late final StreamSubscription<InternetConnectionStatus> _connectionStatusSubscription;
  //you can add subscription to changes in connection types to track changes in connection (e.g. wifi to mobile or none)

  @override
  void onInit(){
    _setupConnectionController();    
    super.onInit();
  }

  void _setupConnectionController() async{
    await _checkIfConnectedOnStart();
    _internetConnectionChecker = InternetConnectionChecker.instance;
    _internetConnectionListener();
  }

  /// check if there is an internet connnection during app start up
  /// initialize the value of _hasInternetConnection
  Future<void> _checkIfConnectedOnStart()async {
    final connectivityResult = await Connectivity().checkConnectivity();
    //if device is not connected to wifi or mobile data, assume it is not connected to the internet
    if(!(connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi))){
      _hasInternetConnection.value = false;
      return;
    }
    final bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if(isConnected){
      _hasInternetConnection = true.obs;
    }else{
      _hasInternetConnection = false.obs;
    }
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