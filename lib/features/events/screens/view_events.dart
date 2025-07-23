import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/theme/custom_themes/text_theme.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/buttons/secondary_elevated_button.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/texts/section_title.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class ViewEventsScreen extends StatefulWidget {
  const ViewEventsScreen({super.key});

  @override
  State<ViewEventsScreen> createState() => _ViewEventsScreenState();
}

class _ViewEventsScreenState extends State<ViewEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Upcoming Events"),
              Card(
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
                                "Dog and Relax"
                              ),
                              const Text("date | time | location"),
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
              ),
              const SectionTitle(title: "Ongoing Events"),
              const SectionTitle(title: "Past Events")
            ],
          ),
        ),
      ),
    );
  }
}