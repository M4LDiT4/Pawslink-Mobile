///@file : model_registry
///@description : contains all models in a map
///@description : all models used within the application should be in registered here


import 'package:mobile_app_template/data/local_storage/models/sample_model.dart';

//@note : define table names here
//@note : tables names will be used on the models
enum SQLITETableName {
  sample,
}

//@note : define models here
final Map<String, String> modelFactories = {
  SampleModel.tableName : SampleModel.createString
};