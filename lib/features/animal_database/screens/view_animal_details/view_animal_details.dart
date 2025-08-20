import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/utils/helpers/string_helper.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_details_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/date_label_listtile.dart';
import 'package:mobile_app_template/features/animal_database/widgets/utility_button.dart';
import 'package:mobile_app_template/features/animal_database/widgets/value_label_column.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

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
    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 300 && _showFab) {
        setState(() => _showFab = false);
      }
    });
    _controller = Get.find<ViewAnimalDetailsController>();
  }

  void _navigateToGenerateQrCode(){
    TNavigationService.toNamed(TAppRoutes.qrCodeGenerator);
  }

  


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animal = _controller.animal;
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
              _buildImage(),
              _buildHeader(context, animal.name, animal.species, animal.sex, isDarkMode),
              const FixedSeparator(space: TSizes.spaceBetweenItems),
              _buildQuickFacts(animal.location, animal.status),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildTraits(animal.traitsAndPersonality),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildSterilizationDetails(animal.sterilizationDate != null, animal.sterilizationDate),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildHealthRecord(
                animal.medicationHistory.map((el) => _ListItem(label: el.medicationName, date: el.dateGiven)).toList()
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildVaxRecord(
                animal.vaccinationHistory.map((el) => _ListItem(label: el.vaccineName, date: el.dateGiven)).toList()
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildNotes(animal.notes, context),
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

  Widget _buildImage(){
    final animal = _controller.animal;
    if(animal.profileImagePath != null){
      return Image.file(File(_controller.animal.profileImagePath!));
    }else if(animal.profileImageLink != null){
      return Image.network(animal.profileImageLink!);
    }
    String iconLink = TImages.catIcon;
    if(animal.species == AnimalSpecies.dog){
      iconLink = TImages.dogIcon;
    }

    return Image.asset(iconLink);
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
          onPress: _navigateToGenerateQrCode,
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
