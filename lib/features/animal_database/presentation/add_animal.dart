import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field.dart';


class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

  void gotoCameraScreen () async{
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GenericImagePicker(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.paddingmd),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: const ExpansionTile(
                      title: Text("Basic Information"),
                      children: [
                        Row(
                          children: [
                            GenericTextField(labelText: "Name"),
                            GenericTextField(labelText: "Location")
                          ],
                        )
                      ],
                    )

                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}


