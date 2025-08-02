import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
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
    return GenericExpansionTile(
      title: widget.title,
      children: [
        AnimatedBuilder(
          animation: _controlller, 
          builder: (context, _){
            if(_controlller.status == WidgetStatus.loading){
              return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    TLottie.catLoader
                  )
                ],
              );
            }
            return Row(
              children: [
                Expanded(
                  child:
                  GenericDonutChart(valueList: _controlller.getDonutValues())
                ),
                Expanded(
                  child: Column(
                    children: [
                      ViewAnimalSummaryListtile(
                        leadingImgPath: TImages.catIcon, 
                        title: _controlller.catCount.toString(), 
                        subtitle: 'cats'
                      ),
                      ViewAnimalSummaryListtile(
                        leadingImgPath: TImages.dogIcon, 
                        title: _controlller.catCount.toString(), 
                        subtitle: 'dogs'
                      )
                    ],
                  )
                )
              ],
            );
          })
      ], 
    );
  }
}