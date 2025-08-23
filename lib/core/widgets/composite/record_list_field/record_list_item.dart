import 'package:mobile_app_template/domain/entities/base_dto.dart';

class RecordListItem {
  final String title;
  final String subTitle;
  final BaseDto data;

  RecordListItem({
    required this.title,
    required this.subTitle,
    required this.data
  });


}