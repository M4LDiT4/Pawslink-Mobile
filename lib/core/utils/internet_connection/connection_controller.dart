import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';

class ConnectionController extends GetxController {
  late final RxBool _hasInternetConnection;
  late final InternetConnectionChecker _internetConnectionChecker;
  late final StreamSubscription<InternetConnectionStatus> _subscription;

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
    final bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if(isConnected){
      _hasInternetConnection = true.obs;
    }else{
      _hasInternetConnection = false.obs;
    }
  }

  ///attach a listener to the internet connection status
  void _internetConnectionListener() {
    _subscription = _internetConnectionChecker.onStatusChange.listen((InternetConnectionStatus status){
      if(status == InternetConnectionStatus.connected){
        _hasInternetConnection.value = true;
        TUIHelpers.showSnackBar("Internet Connnection restored");
      }else{
        _hasInternetConnection.value = false;
        TUIHelpers.showSnackBar("You are offline");
      }
    });
  }

  @override
  void onClose(){
    _subscription.cancel();
    _internetConnectionChecker.dispose();
    super.onClose();
  }

  bool get isConnected{
    return _hasInternetConnection.value;
  }
}