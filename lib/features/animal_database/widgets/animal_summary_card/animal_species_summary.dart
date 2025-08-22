import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';

class AnimalSpeciesSummary {
  int femaleCount;
  int maleCount;
  int spayedCount;
  int neuteredCount;
  int unknownCount;

  AnimalSpeciesSummary({
    int? femaleCount,
    int? maleCount,
    int? spayedCount,
    int? neuteredCount,
    int? unknownCount,
  })  : femaleCount = femaleCount ?? 0,
        maleCount = maleCount ?? 0,
        spayedCount = spayedCount ?? 0,
        neuteredCount = neuteredCount ?? 0,
        unknownCount = unknownCount ?? 0;

  List<GenericDonutChartParams> toDonutChartParams(){
    return [
      GenericDonutChartParams(value: femaleCount.toDouble(), title: "Female", color: AnimalSex.female.color),
      GenericDonutChartParams(value: maleCount.toDouble(), title: "Male", color: AnimalSex.male.color),
      GenericDonutChartParams(value: unknownCount.toDouble(), title: "Unknown", color: AnimalSex.unknown.color)
    ];
  }

  /// check if there is data to display
  /// if all counts are zero, return false
  /// otherwise return true
  bool get hasData => femaleCount > 0 
                      || maleCount > 0 
                      || spayedCount > 0 
                      || neuteredCount > 0
                      || unknownCount > 0;
}