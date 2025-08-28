import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_drafts/view_drafts_list_item.dart';

class ViewDraftsScreen extends StatelessWidget {
  const ViewDraftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){},
        ),
        title: const Text("View Drafts"),
        centerTitle: true,
        backgroundColor: const Color(0xFFDB7093),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.all(16),
        child:  Column(
          children: [
            AnimalDraftListItem(
              name:"Sample animal",
              timeCreated:  DateTime.now(),
              remoteId: "",
              species:  AnimalSpecies.dog,
              status: AnimalStatus.owned,
              sex:  AnimalSex.female,
            )
          ],
        ),
      )
    );

  }
}
