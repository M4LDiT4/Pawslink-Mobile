import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';

class EventListItem extends StatelessWidget {
  final Event event;
  const EventListItem({
    super.key,
    required this.event
  });

  String _parseTime( BuildContext context, int timeInMinutes){
    final hours = timeInMinutes ~/ 60;
    final minutes = timeInMinutes % 60;

    final TimeOfDay tod = TimeOfDay(hour: hours, minute: minutes);
    final localizations = MaterialLocalizations.of(context);
  return localizations.formatTimeOfDay(
      tod,
      alwaysUse24HourFormat: false, // change to true for 24-hour format
    );
  }

  String _parseDate(DateTime date){
    return TFormatter.formatDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(TImages.catIcon),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary
                      ),
                      event.title
                    ),
                    Text("${_parseDate(event.date)} | ${_parseTime(context, event.timeInMinutes)} | location"),
                    const FixedSeparator(space: 8),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FormButton(onPressed: (){}, type: FormButtonType.cancel, child: const Text("-Delete")),
                        FormButton(onPressed: (){}, child: const Text("Edit"))
                      ]
                    ,)
                  ],
                ),  
              )
            )
          ],
        ),
      ),
    );
  }
}