import 'package:flutter/material.dart';

enum ProcessStatus{ loading, success, error }

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  late ProcessStatus status;

  @override
  void initState() {
    super.initState();
    status = ProcessStatus.loading; // Default status
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: const Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}