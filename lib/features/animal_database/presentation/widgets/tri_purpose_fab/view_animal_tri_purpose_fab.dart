// expanded_fab.dart
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/tri_purpose_fab/view_animal_fab.dart';

class ViewAnimalTriPurposeFab extends StatefulWidget {
  final bool isVisible; // whether to show FAB or not (based on tab index)
  
  const ViewAnimalTriPurposeFab({Key? key, required this.isVisible}) : super(key: key);

  @override
  TriPurposeFabState createState() => TriPurposeFabState();
}

class TriPurposeFabState extends State<ViewAnimalTriPurposeFab> with SingleTickerProviderStateMixin {
  late AnimationController _fabAnimationController;
  bool _fabExpanded = false;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _onFabLongPress() {
    setState(() {
      _fabExpanded = true;
      _fabAnimationController.forward();
    });
  }

  void _collapseFab() {
    setState(() {
      _fabExpanded = false;
      _fabAnimationController.reverse();
    });
  }

  void _handlePressMainFAB() {
    if (_fabExpanded) {
      _collapseFab();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) return SizedBox.shrink();

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (_fabExpanded) ...[
          ScaleTransition(
            scale: _fabAnimationController,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: ViewAnimalFab(
                callback: _collapseFab, 
                child: Image.asset(
                  width: TSizes.iconlg,
                  TImages.sort
                )
              )
            ),
          ),
          ScaleTransition(
            scale: _fabAnimationController,
            child: Padding(
              padding: const EdgeInsets.only(right: 80.0, bottom: 0.0),
              child: ViewAnimalFab(
                callback: _collapseFab, 
                child: Image.asset(
                  width: TSizes.iconlg,
                  TImages.filter
                )
              )
            ),
          ),
        ],
        GestureDetector(
          onLongPress: _onFabLongPress,
          onTap: _handlePressMainFAB,
          child: FloatingActionButton(
            onPressed: _handlePressMainFAB,
            child: _fabExpanded
                ? Icon(Icons.close)
                : Image.asset(
                  width: TSizes.iconlg,
                  TImages.search
                ), // Replace with Image.asset if you want
          ),
        ),
      ],
    );
  }
}
