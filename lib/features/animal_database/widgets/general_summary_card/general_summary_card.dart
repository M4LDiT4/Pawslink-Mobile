import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/widgets/donut_label.dart';
import 'package:mobile_app_template/features/animal_database/widgets/general_summary_card/general_summary_card_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_summary_listtile.dart';

class GeneralSummaryCard extends StatefulWidget {
  final String title;

  const GeneralSummaryCard({
    super.key,
    required this.title,
  });

  @override
  State<GeneralSummaryCard> createState() => _GeneralSummaryCardState();
}

class _GeneralSummaryCardState extends State<GeneralSummaryCard> {
  late final GeneralSummaryCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GeneralSummaryCardController();
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
      builder: (context, _) {
        return GenericExpansionTile(
          title: widget.title,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: _buildContent(),
            ),
            const FixedSeparator(space: TSizes.spaceBetweenItems),
            if (_controller.status == WidgetStatus.idle && _controller.hasDataToDisplay)
              _buildDonutLabels(),
          ],
        );
      },
    );
  }

  // === UI Builders ===


  Widget _buildContent(){
    if(_controller.status == WidgetStatus.error) {
      return _buildError();
    }

    if(_controller.status == WidgetStatus.loading) {
      return _buildLoading();
    }

    if(!_controller.hasDataToDisplay) {
      return _buildEmptyContent();
    }

    return _buildChartContent();
  }

  Widget _buildError() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _controller.errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return Row(
      key: const ValueKey('loader'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          TLottie.rotatingCat,
          width: 80,
        ),
      ],
    );
  }


  Widget _buildEmptyContent() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No data to display"),
      ],
    );
  }

  Widget _buildChartContent() {
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
                leadingImgPath: TImages.catIcon,
                title: _controller.catCount.toString(),
                subtitle: 'cats',
              ),
              ViewAnimalSummaryListtile(
                leadingImgPath: TImages.dogIcon,
                title: _controller.dogCount.toString(),
                subtitle: 'dogs',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDonutLabels() {
    return Wrap(
      spacing: TSizes.spaceBetweenItems,
      runSpacing: TSizes.spaceBetweenItems / 2,
      children: _controller.getDonutValues().map((item) {
        return DonutLabel(item: item);
      }).toList(),
    );
  }
}
