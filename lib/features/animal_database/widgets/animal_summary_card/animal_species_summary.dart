import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';

class AnimalSpeciesSummary {
  int femaleCount = 0;
  int maleCount = 0;
  int spayedCount = 0;
  int neuteredCount = 0;

  List<GenericDonutChartParams> toDonutChartParams(){
    return [
      GenericDonutChartParams(value: femaleCount.toDouble(), title: "Female", color: AnimalSex.female.color),
      GenericDonutChartParams(value: maleCount.toDouble(), title: "Male", color: AnimalSex.male.color)
    ];
  }

  /// check if there is data to display
  /// if all counts are zero, return false
  /// otherwise return true
  bool get hasData => femaleCount > 0 || maleCount > 0 || spayedCount > 0 || neuteredCount > 0;
}