import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/utils/helpers/string_helper.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/date_label_listtile.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/utility_button.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/value_label_column.dart';

class ViewAnimalDetailsScreen extends StatefulWidget {
  const ViewAnimalDetailsScreen({super.key});

  @override
  State<ViewAnimalDetailsScreen> createState() => _ViewAnimalDetailsScreenState();
}

class _ViewAnimalDetailsScreenState extends State<ViewAnimalDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 300 && _showFab) {
        setState(() => _showFab = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Scaffold(
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.paddingmd,
            right: TSizes.paddingmd,
            bottom: TSizes.spaceBetweenSections,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(TImages.catIcon),
              _buildHeader(context, "name", AnimalSpecies.cat, AnimalSex.male, isDarkMode),
              const FixedSeparator(space: TSizes.spaceBetweenItems),
              _buildQuickFacts("CUB", AnimalStatus.adopted),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildTraits(["happy", "cheerful", "happy", "cheerful"]),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildSterilizationDetails(true, DateTime.now()),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildHealthRecord([
                _ListItem(label: "deworming", date: DateTime.now()),
                _ListItem(label: "trangkaso", date: DateTime.now()),
              ]),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildVaxRecord([
                _ListItem(label: "rabies", date: DateTime.now()),
                _ListItem(label: "dengue", date: DateTime.now()),
              ]),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildNotes([
                "Prefers quiet environments and minimal handling.",
                "Eats primarily dry food, twice a day.",
                "Gets nervous around strangers but warms up quickly.",
              ], context),
            ],
          ),
        ),
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Icons.arrow_upward,
                color: TColors.backgroundLight,
              ),
            )
          : null,
    );
  }

  Widget _buildHeader(BuildContext context, String name, AnimalSpecies species, AnimalSex sex, bool isDarkMode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TStringHelpers.capitalizeWords(name),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: isDarkMode ? TColors.tertiaryDark : TColors.tertiary),
              ),
              Row(
                children: [
                  Icon(Icons.male, color: sex.color),
                  Text(
                    species.name.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        const FixedSeparator(
          space: TSizes.spaceBetweenItems / 2,
          orientation: SeparatorOrientation.horizontal,
        ),
        UtilityButton(
          onPress: () {},
          child: const Icon(Iconsax.scan, size: TSizes.iconxl, color: TColors.primary),
        ),
        const FixedSeparator(
          space: TSizes.spaceBetweenItems / 2,
          orientation: SeparatorOrientation.horizontal,
        ),
        UtilityButton(
          onPress: () {},
          child: const Icon(Iconsax.edit, size: TSizes.iconxl, color: TColors.primary),
        )
      ],
    );
  }

  Widget _buildQuickFacts(String location, AnimalStatus status) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueLabelColumn(value: location.toUpperCase(), label: "location"),
        ValueLabelColumn(value: status.name.toUpperCase(), label: "status"),
      ],
    );
  }

  Widget _buildSection(String title, Widget child) {
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
        const FixedSeparator(space: 8),
        child,
      ],
    );
  }

  Widget _buildSectionWithList(String label, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(Get.context!).colorScheme.primary,
              ),
        ),
        const FixedSeparator(space: 8),
        ...children,
      ],
    );
  }

  Widget _buildSterilizationDetails(bool isSterilized, DateTime? date) {
    String dateValue = "NA";
    if (isSterilized && date != null) {
      dateValue = TFormatter.formatDate(date);
    }
    final child = Row(
      children: [
        ValueLabelColumn(value: isSterilized ? "yes" : "no", label: "neutered/spayed"),
        ValueLabelColumn(value: dateValue, label: "date"),
      ],
    );
    return _buildSection("Sterilization Details", child);
  }

  Widget _buildHealthRecord(List<_ListItem> items) {
    List<Widget> widgetList = [const Text("--No Record--")];

    if (items.isNotEmpty) {
      widgetList = items
          .map((item) => DateLabelListtile(
                label: item.label,
                date: item.date,
                iconData: Icons.medical_information,
              ))
          .toList();
    }
    return _buildSectionWithList("Health Record", widgetList);
  }

  Widget _buildVaxRecord(List<_ListItem> items) {
    List<Widget> widgetList = [const Text("--No Record--")];

    if (items.isNotEmpty) {
      widgetList = items
          .map((item) => DateLabelListtile(
                label: item.label,
                date: item.date,
                iconData: Icons.vaccines,
              ))
          .toList();
    }
    return _buildSectionWithList("Vaccination Record", widgetList);
  }

  Widget _buildTraits(List<String> traits) {
    Widget child = const Text("--No Record--");
    if (traits.isNotEmpty) {
      child = Wrap(
        spacing: 8,
        runSpacing: 4,
        children: traits.map((item) => Chip(label: Text(item))).toList(),
      );
    }
    return _buildSection("Traits and Personality", child);
  }

  Widget _buildNotes(List<String> notes, BuildContext context) {
    List<Widget> children = const [Text("--No Record--")];

    if (notes.isNotEmpty) {
      children = notes.map((item) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Iconsax.pet5, size: TSizes.iconlg, color: Theme.of(context).colorScheme.tertiary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        );
      }).toList();
    }
    return _buildSectionWithList("Notes", children);
  }
}

class _ListItem {
  final String label;
  final DateTime date;

  const _ListItem({
    required this.label,
    required this.date,
  });
}
