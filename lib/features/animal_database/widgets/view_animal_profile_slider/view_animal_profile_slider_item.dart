import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';

class ViewAnimalProfileSliderItem extends StatelessWidget {
  final AnimalDTO? animal;
  final bool isLoading;

  const ViewAnimalProfileSliderItem({
    super.key,
    this.animal,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget shimmerBox({
      double? width,
      double? height,
      BorderRadius? radius,
    }) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius ?? BorderRadius.circular(4),
          ),
        ),
      );
    }

    Widget buildShimmerCard() {
      return Card(
        elevation: 4,
        child: SizedBox(
          width: 180,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.paddingmd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerBox(
                  width: double.infinity,
                  height: 160,
                  radius: BorderRadius.circular(TSizes.borderRadiussm),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerBox(width: 80, height: 16),
                    shimmerBox(
                      width: 20,
                      height: 20,
                      radius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    shimmerBox(width: 16, height: 16, radius: BorderRadius.circular(4)),
                    const SizedBox(width: 8),
                    shimmerBox(width: 60, height: 14),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildRealCard() {
      // Determine image to show
      final imagePath = animal?.profileImagePath;
      final fallbackImage = (animal?.species == AnimalSpecies.cat)
          ? TImages.catIcon
          : TImages.dogIcon;

      return Card(
        elevation: 4,
        child: SizedBox(
          width: 180,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.paddingmd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(TSizes.borderRadiussm),
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: imagePath != null
                        ? Image.file(
                            File(imagePath),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            fallbackImage,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        animal?.name ?? "Unknown",
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      animal?.sex.icon ?? Icons.male,
                      color: animal?.sex.color ?? Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Iconsax.location, size: TSizes.iconsm),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        animal?.location ?? "Unknown",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SizedBox(
      child: isLoading || animal == null ? buildShimmerCard() : buildRealCard(),
    );
  }
}
