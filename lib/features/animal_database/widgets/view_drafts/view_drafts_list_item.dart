import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/widgets/image/smart_image.dart';

class AnimalDraftListItem extends StatelessWidget {
  final String name;
  final DateTime timeCreated;
  final String remoteId;
  final AnimalSpecies species;
  final AnimalStatus status;
  final AnimalSex sex;
  const AnimalDraftListItem({
    required this.name,
    required this.timeCreated,
    required this.remoteId,
    required this.species,
    required this.status,
    required this.sex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 48,
          height: 48,
          child: SmartImage(
            fallbackAsset: species == AnimalSpecies.dog
            ? TImages.dogIcon 
            : TImages.catIcon
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: status.color,
                  ),
                  Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    name
                  ),
                ],
              ),
            ),
            Icon( 
              sex == AnimalSex.female 
              ? Icons.female 
              : Icons.male,
              color: sex.color,
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              style: const TextStyle(
                fontSize: 12
              ),
              "Created: ${TFormatter.formatDate(timeCreated)}"
            ),
          ],
        ),
      ),
    );
  }
}