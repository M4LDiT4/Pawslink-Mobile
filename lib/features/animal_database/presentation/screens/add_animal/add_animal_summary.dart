import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';

class AddAnimalSummary extends StatelessWidget {
  final AddAnimalSummaryParams params = Get.arguments as AddAnimalSummaryParams;

  AddAnimalSummary({super.key});

  Widget _buildInfoTile(String? label, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: TColorUtils.tertiary()),
      title: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: label != null ? Text(label) : null,
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(Get.context!).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 12),
        ...children,
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildFixedSection(String title, List<Widget> children) {
    return _buildSection(title, children);
  }

  Widget _buildSectionWithList(String title, List<String> stringlist, IconData leadingIcon) {
    final children = <Widget>[];
    if (stringlist.isEmpty) {
      children.add(
        ListTile(
          title: Text(
            '-- No Record --',
            style: TextStyle(color: Theme.of(Get.context!).hintColor),
          ),
        ),
      );
    } else {
      for (var item in stringlist) {
        children.add(_buildInfoTile(null, item, leadingIcon));
      }
    }
    return _buildSection(title, children);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Summary", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),

            _buildFixedSection("Basic Information", [
              _buildInfoTile("Name", params.name, Iconsax.pet),
              _buildInfoTile("Age", params.age, Iconsax.cake),
              _buildInfoTile("Location", params.location, Iconsax.location),
              _buildInfoTile("Sex", params.sex, Iconsax.user),
              _buildInfoTile("Species", params.species, Iconsax.category),
              _buildInfoTile("Status", params.status, Iconsax.status),
            ]),
            _buildSectionWithList("Coat Color", params.coatColor, Icons.color_lens),
            _buildSectionWithList("Traits and Personality", params.traits, Icons.tag),
            _buildSectionWithList("Notes", params.notes, Iconsax.note),
            _buildSectionWithList("Vaccination History", params.vaccinations, Icons.vaccines),
            _buildSectionWithList("Medication", params.medications, Icons.medical_information),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                icon: const Icon(Icons.check),
                label: const Text("Confirm"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
