import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';


class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

  void gotoCameraScreen () async{
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GenericImagePicker()
            ],
          ),
        ),
      ),
    );
  }
}


