import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';

class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

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
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(TSizes.paddingmd),
                    child: Text("This is a card"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}