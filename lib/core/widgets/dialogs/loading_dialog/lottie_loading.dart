// lottie_loading_animation.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';

class LottieLoadingAnimation extends StatelessWidget {
  const LottieLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      TLottie.loading,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
    );
  }
}
