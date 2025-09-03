import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/widgets/image/smart_image.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_drafts_controller.dart';

class AnimalDraftListItem extends StatelessWidget {
  final String name;
  final DateTime timeCreated;
  final String remoteId;
  final AnimalSpecies species;
  final AnimalStatus status;
  final AnimalSex sex;

  AnimalDraftListItem({
    required this.name,
    required this.timeCreated,
    required this.remoteId,
    required this.species,
    required this.status,
    required this.sex,
    super.key,
  });

  final _controller = Get.find<ViewDraftsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isMultiSelect = _controller.multiSelect.value;
      final isSelected = _controller.selectedIdList.contains(remoteId);

      return Card(
        child: ListTile(
          onTap: () {
            if (isMultiSelect) {
              if (isSelected) {
                _controller.selectedIdList.remove(remoteId);
              } else {
                _controller.selectedIdList.add(remoteId);
              }
            } else {
              // TODO: normal single tap action (like opening details)
            }
          },
          onLongPress: () {
            if (!isMultiSelect) {
              _controller.multiSelect.value = true;
            }
            if (!_controller.selectedIdList.contains(remoteId)) {
              _controller.selectedIdList.add(remoteId);
            }
          },
          leading: SizedBox(
            width: 48,
            height: 48,
            child: SmartImage(
              fallbackAsset: species == AnimalSpecies.dog
                  ? TImages.dogIcon
                  : TImages.catIcon,
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
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Icon(
                sex == AnimalSex.female ? Icons.female : Icons.male,
                color: sex.color,
              ),
            ],
          ),
          subtitle: Text(
            "Created: ${TFormatter.formatDate(timeCreated)}",
            style: const TextStyle(fontSize: 12),
          ),
          trailing: isMultiSelect
              ? Checkbox(
                  value: isSelected,
                  onChanged: (checked) {
                    if (checked == true) {
                      _controller.selectedIdList.add(remoteId);
                    } else {
                      _controller.selectedIdList.remove(remoteId);
                    }
                  },
                )
              : null,
        ),
      );
    });
  }
}
