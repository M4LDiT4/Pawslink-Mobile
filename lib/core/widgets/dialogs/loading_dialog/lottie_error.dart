import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';

class LottieErrorAnimation extends StatefulWidget {
  const LottieErrorAnimation({super.key});

  @override
  State<LottieErrorAnimation> createState() => _LottieErrorAnimationState();
}

class _LottieErrorAnimationState extends State<LottieErrorAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      TLottie.failed,
      width: TSizes.iconxxl,
      fit: BoxFit.fill,
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward(); // Play once automatically
      },
    );
  }
}
