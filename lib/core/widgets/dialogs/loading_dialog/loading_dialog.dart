import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

enum ProcessStatus{ loading, success, error }

class LoadingDialog extends StatefulWidget {
  final String loadingMessage;
  final String errorMessage;
  final String successMessage;
  
  const LoadingDialog({
    super.key,
    this.loadingMessage = "Saving...",
    this.errorMessage = "Operation Encountered an Error",
    this.successMessage = "Operation Successful"
  });

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

  Widget _renderLoadingContent(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.loadingMessage),
        const FixedSeparator(space: TSizes.spaceBetweenItems),
        const CircularProgressIndicator(),
        const FixedSeparator(space: TSizes.spaceBetweenItems),
      ],
    );
  }

  Widget _renderErrorContent(){
    return Column(
      children: [
        Text(widget.errorMessage),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FormButton(
              onPressed: (){},
              child: const Text("Retry"),
            ),
            TextButton(
              onPressed: (){}, 
              child: const Text("Cancel")
            )
          ],
        )
      ],
    );
  }

  Widget _renderContent(){
    switch(status){
      case ProcessStatus.loading:
        return _renderLoadingContent();
      case ProcessStatus.success:
        return Text(widget.successMessage);
      case ProcessStatus.error:
        return _renderErrorContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                style: Theme.of(context).textTheme.titleLarge,
                "Adding Animal"
              ),
            ],
          ),
          const FixedSeparator(space: TSizes.spaceBetweenSections),
          _renderContent(),
        ],
      ),
    );
  }
}