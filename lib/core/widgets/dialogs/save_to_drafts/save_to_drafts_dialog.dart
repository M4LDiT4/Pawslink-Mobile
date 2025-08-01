import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class SaveToDraftsDialog extends StatelessWidget {
  const SaveToDraftsDialog({super.key});

  void _handleCancel(){
    TNavigationService.back(result: TResponse.failed("Will not save to drafts"));
  }

  void _handleConfirm(){
    TNavigationService.back(result: TResponse.successful("Saving to drafts"));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            style: Theme.of(context).textTheme.titleLarge,
            "You are not connected to the internet.\nSave in Drafts?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FormButton(
                onPressed: _handleCancel, 
                type: FormButtonType.cancel,
                child: const Text("Cancel"), 
              ),
              FormButton(
                onPressed: _handleConfirm, 
                child: const Text("Save")
              )
            ],
          )
        ],
      ),
    );
  }
}