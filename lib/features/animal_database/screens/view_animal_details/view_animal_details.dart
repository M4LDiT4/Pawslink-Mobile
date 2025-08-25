import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/utils/helpers/string_helper.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_details_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/date_label_listtile.dart';
import 'package:mobile_app_template/features/animal_database/widgets/utility_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/value_label_column.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class ViewAnimalDetailsScreen extends StatefulWidget {
  const ViewAnimalDetailsScreen({super.key});

  @override
  State<ViewAnimalDetailsScreen> createState() => _ViewAnimalDetailsScreenState();
}

class _ViewAnimalDetailsScreenState extends State<ViewAnimalDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final ViewAnimalDetailsController _controller;
  bool _showFab = false;

  @override
  void initState() {
    super.initState();

    _controller = Get.find<ViewAnimalDetailsController>();

    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > 300;
      if (shouldShow != _showFab) setState(() => _showFab = shouldShow);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToGenerateQrCode() {
    final animal = _controller.animal;
    TNavigationService.toNamed(
      TAppRoutes.qrCodeGenerator,
      arguments: {
        'remoteId': animal.remoteId,
        'name': animal.name,
      },
    );
  }

  void _navigateToEditAnimal() {
    TNavigationService.toNamed(TAppRoutes.addAnimal, arguments: _controller.animal);
  }

  @override
  Widget build(BuildContext context) {
    final animal = _controller.animal;
    final isDarkMode = TDeviceUtils.isDarkMode();

    return Scaffold(
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.paddingmd,
        ).copyWith(bottom: TSizes.spaceBetweenSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnimalImage(animal),
            _buildHeader(context, animal, isDarkMode),
            const FixedSeparator(space: TSizes.spaceBetweenItems),
            _buildQuickFacts(animal),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildTraitsSection(animal),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildCoatColorSection(animal),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildSterilizationSection(animal),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildHealthRecordSection(animal),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildVaccinationSection(animal),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildNotesSection(animal, context),
          ],
        ),
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.arrow_upward, color: TColors.backgroundLight),
            )
          : null,
    );
  }

  // -----------------------
  // Image & Header Section
  // -----------------------
  Widget _buildAnimalImage(animal) {
    if (animal.profileImagePath != null) return Image.file(File(animal.profileImagePath!));

    if (animal.profileImageLink != null) {
      return Image.network(
        animal.profileImageLink!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 48, color: Colors.grey),
      );
    }

    // Default icon
    final iconLink = animal.species == AnimalSpecies.dog ? TImages.dogIcon : TImages.catIcon;
    return Image.asset(iconLink);
  }

  Widget _buildHeader(BuildContext context, AnimalDTO animal, bool isDarkMode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TStringHelpers.capitalizeWords(animal.name),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: isDarkMode ? TColors.tertiaryDark : TColors.tertiary,
                    ),
              ),
              Row(
                children: [
                  Icon(Icons.male, color: animal.sex.color),
                  const SizedBox(width: 4),
                  Text(
                    animal.species.name.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        UtilityButton(
          onPress: _navigateToGenerateQrCode,
          child: const Icon(Iconsax.scan, size: TSizes.iconxl, color: TColors.primary),
        ),
        const SizedBox(width: TSizes.spaceBetweenItems / 2),
        UtilityButton(
          onPress: _navigateToEditAnimal,
          child: const Icon(Iconsax.edit, size: TSizes.iconxl, color: TColors.primary),
        ),
      ],
    );
  }

  // -----------------------
  // Quick Facts
  // -----------------------
  Widget _buildQuickFacts(AnimalDTO animal) {
    return Row(
      children: [
        ValueLabelColumn(value: animal.location.toUpperCase(), label: "location"),
        ValueLabelColumn(value: animal.status.name.toUpperCase(), label: "status"),
      ],
    );
  }

  // -----------------------
  // Traits & Coat Color
  // -----------------------
  Widget _buildTraitsSection(AnimalDTO animal) {
    final child = animal.traitsAndPersonality.isEmpty
        ? const Text("--No Record--")
        : Wrap(
            spacing: 8,
            runSpacing: 4,
            children: animal.traitsAndPersonality.map((trait) => Chip(label: Text(trait))).toList(),
          );
    return _buildSection("Traits and Personality", child);
  }

  Widget _buildCoatColorSection(AnimalDTO animal) {
    final child = animal.coatColor.isEmpty
        ? const Text("--No Record--")
        : Wrap(
            spacing: 8,
            runSpacing: 4,
            children: animal.coatColor.map((color) => Chip(label: Text(color))).toList(),
          );
    return _buildSection("Coat Color", child);
  }

  // -----------------------
  // Sterilization
  // -----------------------
  Widget _buildSterilizationSection(AnimalDTO animal) {
    final dateValue =
        (animal.sterilizationDate != null) ? TFormatter.formatDate(animal.sterilizationDate!) : "NA";

    final child = Row(
      children: [
        ValueLabelColumn(value: animal.sterilizationDate != null ? "yes" : "no", label: "neutered/spayed"),
        ValueLabelColumn(value: dateValue, label: "date"),
      ],
    );

    return _buildSection("Sterilization Details", child);
  }

  // -----------------------
  // Health & Vaccination Records
  // -----------------------
  Widget _buildHealthRecordSection(AnimalDTO animal) {
    final items = animal.medicationHistory
        .map((e) => _ListItem(label: e.medicationName, date: e.dateGiven))
        .toList();
    return _buildRecordSection("Health Record", items, Icons.medical_information);
  }

  Widget _buildVaccinationSection(AnimalDTO animal) {
    final items = animal.vaccinationHistory
        .map((e) => _ListItem(label: e.vaccineName, date: e.dateGiven))
        .toList();
    return _buildRecordSection("Vaccination Record", items, Icons.vaccines);
  }

  Widget _buildRecordSection(String title, List<_ListItem> items, IconData icon) {
    if (items.isEmpty) return _buildSectionWithList(title, [const Text("--No Record--")]);

    final children = items
        .map((item) => DateLabelListtile(label: item.label, date: item.date, iconData: icon))
        .toList();

    return _buildSectionWithList(title, children);
  }

  // -----------------------
  // Notes
  // -----------------------
  Widget _buildNotesSection(AnimalDTO animal, BuildContext context) {
    if (animal.notes.isEmpty) return _buildSectionWithList("Notes", [const Text("--No Record--")]);

    final children = animal.notes.map((note) {
      return Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Iconsax.pet5, size: TSizes.iconlg, color: Theme.of(context).colorScheme.tertiary),
            const SizedBox(width: 8),
            Expanded(child: Text(note, style: Theme.of(context).textTheme.bodyLarge)),
          ],
        ),
      );
    }).toList();

    return _buildSectionWithList("Notes", children);
  }

  // -----------------------
  // Section Helpers
  // -----------------------
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

  Widget _buildSectionWithList(String title, List<Widget> children) {
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
        ...children,
      ],
    );
  }
}

class _ListItem {
  final String label;
  final DateTime date;

  const _ListItem({required this.label, required this.date});
}
