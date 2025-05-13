import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';

class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GenericAppbar(),
    );
  }
}