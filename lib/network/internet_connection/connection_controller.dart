import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';

/// ## ConnectionController
/// Keeps track of the internet connection status of the application
class ConnectionController extends GetxController {
  late final RxBool _hasInternetConnection;
  late final InternetConnectionChecker _internetConnectionChecker;
  late final StreamSubscription<InternetConnectionStatus> _connectionStatusSubscription;

  Future<void> init() async {
    final connected = await TDeviceUtils.hasInternetConnection();
    _hasInternetConnection = connected.obs;
  }

  @override
  void onInit() {
    _setupConnectionController();
    super.onInit();
  }

  void _setupConnectionController() {
    _internetConnectionChecker = InternetConnectionChecker.instance;
    _internetConnectionListener();
  }

  /// Attach a listener to the internet connection status
  void _internetConnectionListener() {
    _connectionStatusSubscription =
        _internetConnectionChecker.onStatusChange.listen((InternetConnectionStatus status) {
      final hasConnection = status == InternetConnectionStatus.connected;

      // Only act if the state actually changed
      if (hasConnection != _hasInternetConnection.value) {
        _hasInternetConnection.value = hasConnection;

        if (hasConnection) {
          TUIHelpers.showStateSnackBar(
            "You are online",
            state: SnackBarState.success,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          TUIHelpers.showStateSnackBar(
            "You are offline",
            state: SnackBarState.neutral,
            snackPosition: SnackPosition.TOP,
          );
        }
      }
    });
  }

  @override
  void onClose() {
    _connectionStatusSubscription.cancel();
    _internetConnectionChecker.dispose();
    super.onClose();
  }

  /// Checks if device is connected to the internet
  bool get isConnected => _hasInternetConnection.value;
}
