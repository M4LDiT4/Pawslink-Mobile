
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_summary_card/animal_species_summary_card_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/donut_label.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_summary_listtile.dart';

class AnimalSpeciesSummaryCard extends StatefulWidget {
  final String title;
  final AnimalSpecies species;

  const AnimalSpeciesSummaryCard({
    super.key,
     required this.title,
     required this.species
  });

  @override
  State<AnimalSpeciesSummaryCard> createState() => _AnimalSummaryCardState();
}

class _AnimalSummaryCardState extends State<AnimalSpeciesSummaryCard> {
  
  late final AnimalSpeciesSummaryCardController _controller;
  
  @override 
  void initState() {
    super.initState();
    _controller = AnimalSpeciesSummaryCardController(species: widget.species);
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(!_controller.hasLoaded){
        _controller.loadInitialData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => GenericExpansionTile(
        title: widget.title,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildContent(),
          ),
          const FixedSeparator(space: TSizes.spaceBetweenItems),
          if (_controller.status == WidgetStatus.idle && _controller.hasDataToDisplay)
            Wrap(
              spacing: TSizes.spaceBetweenItems,
              runSpacing: TSizes.spaceBetweenItems / 2,
              children: _controller.getDonutValues().map((item) {
                return DonutLabel(item: item);
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_controller.status == WidgetStatus.error) {
      return _buildErrorContent();
    }

    if (_controller.status == WidgetStatus.loading) {
      return _buildLoadingContent();
    }

    if (!_controller.hasDataToDisplay) {
      return _buildEmptyContent();
    }

    return _buildDataContent();
  }

  Widget _buildErrorContent() {
    return Row(
      key: const ValueKey('error'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _controller.errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }

  Widget _buildEmptyContent() {
    return const Row(
      key: ValueKey('empty'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No data to display"),
      ],
    );
  }

  Widget _buildLoadingContent() {
    return Row(
      key: const ValueKey('loader'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          width: 80,
          TLottie.rotatingCat,
        )
      ],
    );
  }

  Widget _buildDataContent() {
    return Row(
      key: const ValueKey('data'),
      children: [
        Expanded(
          child: GenericDonutChart(
            valueList: _controller.getDonutValues(),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ViewAnimalSummaryListtile(
                leadingImgPath: TImages.spayed,
                title: _controller.spayedCount.toString(),
                subtitle: "spayed",
              ),
              ViewAnimalSummaryListtile(
                leadingImgPath: TImages.neutered,
                title: _controller.neuteredCount.toString(),
                subtitle: "neutered",
              ),
            ],
          ),
        ),
      ],
    );
  }

}
