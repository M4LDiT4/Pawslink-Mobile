
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_med_history_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_vax_history_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';

const isarSchemas = <CollectionSchema>[
  AnimalSchema,
  EventSchema,
  AnimalVaccinationSchema,
  AnimalMedicationSchema,
];