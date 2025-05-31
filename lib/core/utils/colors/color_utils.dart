import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class TColorUtils {
  TColorUtils._();

  // Core ColorScheme values
  static Color primary() => Theme.of(Get.context!).colorScheme.primary;
  static Color onPrimary() => Theme.of(Get.context!).colorScheme.onPrimary;
  static Color primaryContainer( ) => Theme.of( Get.context!).colorScheme.primaryContainer;
  static Color onPrimaryContainer( ) => Theme.of( Get.context!).colorScheme.onPrimaryContainer;

  static Color secondary( ) => Theme.of( Get.context!).colorScheme.secondary;
  static Color onSecondary( ) => Theme.of( Get.context!).colorScheme.onSecondary;
  static Color secondaryContainer( ) => Theme.of( Get.context!).colorScheme.secondaryContainer;
  static Color onSecondaryContainer( ) => Theme.of( Get.context!).colorScheme.onSecondaryContainer;

  static Color tertiary( ) => Theme.of( Get.context!).colorScheme.tertiary;
  static Color onTertiary( ) => Theme.of( Get.context!).colorScheme.onTertiary;
  static Color tertiaryContainer( ) => Theme.of( Get.context!).colorScheme.tertiaryContainer;
  static Color onTertiaryContainer( ) => Theme.of( Get.context!).colorScheme.onTertiaryContainer;



  static Color surface( ) => Theme.of( Get.context!).colorScheme.surface;
  static Color onSurface( ) => Theme.of( Get.context!).colorScheme.onSurface;
  static Color surfaceVariant( ) => Theme.of( Get.context!).colorScheme.surfaceContainerHighest;
  static Color onSurfaceVariant( ) => Theme.of( Get.context!).colorScheme.onSurfaceVariant;

  static Color error( ) => Theme.of( Get.context!).colorScheme.error;
  static Color onError( ) => Theme.of( Get.context!).colorScheme.onError;
  static Color errorContainer( ) => Theme.of( Get.context!).colorScheme.errorContainer;
  static Color onErrorContainer( ) => Theme.of( Get.context!).colorScheme.onErrorContainer;

  // Outline and borders
  static Color outline( ) => Theme.of( Get.context!).colorScheme.outline;
  static Color outlineVariant( ) => Theme.of( Get.context!).colorScheme.outlineVariant;

  // Inverse
  static Color inverseSurface( ) => Theme.of( Get.context!).colorScheme.inverseSurface;
  static Color onInverseSurface( ) => Theme.of( Get.context!).colorScheme.onInverseSurface;
  static Color inversePrimary( ) => Theme.of( Get.context!).colorScheme.inversePrimary;

  // Extras (optional but useful)
  static Color disabled( ) => Theme.of( Get.context!).disabledColor;
  static Color divider( ) => Theme.of( Get.context!).dividerColor;
  static Color shadow( ) => Theme.of( Get.context!).shadowColor;
  static Color hint( ) => Theme.of( Get.context!).hintColor;

  static Color caption( ) =>
      Theme.of( Get.context!).brightness == Brightness.dark
          ? Colors.grey[400]!
          : Colors.grey[600]!;
          
  static Color getContrastingTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }
}
