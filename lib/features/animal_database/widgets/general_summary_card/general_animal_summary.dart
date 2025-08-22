import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';

class GeneralAnimalSummary {
  int adopted;
  int onCampus;
  int owned;
  int transient;
  int rainbowBridge;
  int unknown;
  int cat;
  int dog;

  GeneralAnimalSummary({
    int? adopted,
    int? onCampus,
    int? owned,
    int? transient,
    int? rainbowBridge,
    int? unknown,
    int? cat,
    int? dog,
  })  : adopted = adopted ?? 0,
        onCampus = onCampus ?? 0,
        owned = owned ?? 0,
        transient = transient ?? 0,
        rainbowBridge = rainbowBridge ?? 0,
        unknown = unknown ?? 0,
        cat = cat ?? 0,
        dog = dog ?? 0;
        
  List<GenericDonutChartParams> toDonutChartParams() {
    return [
      GenericDonutChartParams(
        value: adopted.toDouble(),
        title: "Adopted",
        color: AnimalStatus.adopted.color,
      ),
      GenericDonutChartParams(
        value: onCampus.toDouble(),
        title: "On Campus",
        color: AnimalStatus.onCampus.color,
      ),
      GenericDonutChartParams(
        value: owned.toDouble(),
        title: "Owned",
        color: AnimalStatus.owned.color,
      ),
      GenericDonutChartParams(
        value: transient.toDouble(),
        title: "Transient",
        color: AnimalStatus.transient.color,
      ),
      GenericDonutChartParams(
        value: rainbowBridge.toDouble(),
        title: "Rainbow bridge",
        color: AnimalStatus.rainbowBridge.color,
      ),
      GenericDonutChartParams(
        value: unknown.toDouble(), 
        title: "Unknown", 
        color: AnimalStatus.unknown.color
      )
    ];
  }

  bool hasData() {
    return adopted > 0 
    || onCampus > 0 
    || owned > 0 
    || transient > 0 
    || rainbowBridge > 0 
    || cat > 0 
    || dog > 0
    || unknown > 0;
  }
}

