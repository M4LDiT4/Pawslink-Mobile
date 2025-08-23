
import 'package:isar/isar.dart';
import 'package:mobile_app_template/domain/models/local_activity_log.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/domain/models/local_animal_model.dart';
import 'package:mobile_app_template/domain/models/local_animal_vaccination_history.dart';

const isarSchemas = <CollectionSchema>[
  LocalAnimalModelSchema,
  LocalAnimalVaccinationRecordSchema,
  LocalAnimalMedicationRecordSchema,
  LocalActivityLogSchema
];