import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';

class UpdateConfirmationDialog extends StatelessWidget {
  const UpdateConfirmationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: 0.6, // crop vertically
            child: Lottie.asset(TLottie.dogWaiting),
          ),
        ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "Updating ensures you have the most recent information."
        ),
      ),
    ],);
  }
}