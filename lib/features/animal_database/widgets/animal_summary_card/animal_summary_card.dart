
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';

class AnimalSummaryCard extends StatefulWidget {
  final String title;
  final AnimalSpecies species;
  const AnimalSummaryCard({
    super.key,
     required this.title,
     required this.species
  });

  @override
  State<AnimalSummaryCard> createState() => _AnimalSummaryCardState();
}

class _AnimalSummaryCardState extends State<AnimalSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}