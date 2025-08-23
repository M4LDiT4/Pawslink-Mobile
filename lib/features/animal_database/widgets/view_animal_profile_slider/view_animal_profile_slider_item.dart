import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';

class ViewAnimalProfileSliderItem extends StatelessWidget {
  final AnimalProfile animal;

  const ViewAnimalProfileSliderItem({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: 180,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.paddingmd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(height: 8),
              _buildNameAndSex(context),
              const SizedBox(height: 6),
              _buildLocation(),
            ],
          ),
        ),
      ),
    );
  }

  // --- PRIVATE WIDGETS ---

  Widget _buildImage() {
    final imagePath = animal.animalPofileLink;
    final fallbackImage = (animal.species == AnimalSpecies.cat)
        ? TImages.catIcon
        : TImages.dogIcon;

    return ClipRRect(
      borderRadius: BorderRadius.circular(TSizes.borderRadiussm),
      child: SizedBox(
        width: double.infinity,
        height: 160,
        child: imagePath != null
            ? Image.file(File(imagePath), fit: BoxFit.cover)
            : Image.asset(fallbackImage, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildNameAndSex(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            animal.name,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(
          animal.sex.icon,
          color: animal.sex.color,
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        const Icon(Iconsax.location, size: TSizes.iconsm),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            animal.location,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
