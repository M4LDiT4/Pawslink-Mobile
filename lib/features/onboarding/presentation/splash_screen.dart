import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/internet_connection/connection_controller.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final ConnectionController _connectionController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _connectionController = Get.find<ConnectionController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthentication();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkAuthentication() async{
    final accessToken = await LocalSecureStorageService().getData(LocalSecureStorageService.accessToken);
    if(accessToken == null){
      TNavigationService.offAllNamed(TAppRoutes.login);
    }else{
      TNavigationService.offAllNamed(TAppRoutes.home);
    }
    //add here
    //if there is an authenticated user, check access toke
    //if access token is valid, go to home
    //else rotate the token using the refresh token (if there is none go to login)
    //if new access token is generated using the refresh token, go to home
    //else (e.g. the refresh token has expired) go to login 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              TLottie.background,
              fit: BoxFit.cover
            ),
          ),
          Center(
            child: Lottie.asset(
              width: 200,
              fit: BoxFit.fill,
              TLottie.dogBegging
            ),
          )
        ],
      ) 
    );
  }
}
