import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';

class GeneralAnimalSummary {
  int adopted = 0;
  int onCampus = 0;
  int owned = 0;
  int transient = 0;
  int rainbowBridge = 0;
  int cat = 0;
  int dog = 0;

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
        color: AnimalStatus.on_campus.color,
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
        color: AnimalStatus.rainbow_bridge.color,
      ),
    ];
  }

  bool hasData() {
    return adopted > 0 ||
        onCampus > 0 ||
        owned > 0 ||
        transient > 0 ||
        rainbowBridge > 0 ||
        cat > 0 ||
        dog > 0;
  }
}
