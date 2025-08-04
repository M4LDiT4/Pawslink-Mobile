import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_summary_card/animal_species_summary_card.dart';
import 'package:mobile_app_template/features/animal_database/widgets/donut_label.dart';
import 'package:mobile_app_template/features/animal_database/widgets/general_summary_card/general_summary_card_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_summary_listtile.dart';

class GeneralSummaryCard extends StatefulWidget {
  final String title;
  const GeneralSummaryCard({
    super.key,
    required this.title
  });

  @override
  State<GeneralSummaryCard> createState() => _GeneralSummaryCardState();
}

class _GeneralSummaryCardState extends State<GeneralSummaryCard> {
  late GeneralSummaryCardController _controlller;

  @override 
  void initState(){
    super.initState();
    _controlller = GeneralSummaryCardController();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controlller, 
      builder: (context, _) => GenericExpansionTile(
        title: widget.title,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation){
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }, 
            child: 
              _controlller.status == WidgetStatus.error?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_controlller.errorMessage, style: const TextStyle(color: Colors.red)),
                ],
              ):
              _controlller.status == WidgetStatus.loading
              ? Row(
                  key: const ValueKey('loader'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      width: 180,
                      TLottie.catLoader
                    ),
                  ],
                )
              : Row(
                  key: const ValueKey('data'),
                  children: [
                    Expanded(
                      child: GenericDonutChart(
                        valueList: _controlller.getDonutValues(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ViewAnimalSummaryListtile(
                            leadingImgPath: TImages.catIcon,
                            title: _controlller.catCount.toString(),
                            subtitle: 'cats',
                          ),
                          ViewAnimalSummaryListtile(
                            leadingImgPath: TImages.dogIcon,
                            title: _controlller.dogCount.toString(),
                            subtitle: 'dogs',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
          const FixedSeparator(space: TSizes.spaceBetweenItems),
          if(_controlller.status == WidgetStatus.idle) Wrap(
            spacing: TSizes.spaceBetweenItems,
            runSpacing: TSizes.spaceBetweenItems/2,
            children: _controlller.getDonutValues().map((item){
              return DonutLabel(item: item);
            }).toList(),
          )
        ],
      )
    );
  }
}

