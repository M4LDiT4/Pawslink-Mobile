import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/buttons/admin/admin_home_actionbutton.dart';
import 'package:mobile_app_template/data/local_storage/isar/database/isar_service.dart';
import 'package:mobile_app_template/data/local_storage/isar/repositories/event_repository.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AdminEventsScreens extends StatefulWidget {
  const AdminEventsScreens({super.key});

  @override
  State<AdminEventsScreens> createState() => _AdminEventsScreensState();
}

class _AdminEventsScreensState extends State<AdminEventsScreens> {
  late final double screenHeight;
  late final double screenWidth;
  late final bool isDarkMode;

  @override
  void initState() {
    super.initState();
    getIt.registerLazySingleton<EventRepository>(()=>EventRepository(getIt.get<IsarService>().isar));
  }

  @override
  void dispose(){
    super.dispose();
    getIt.unregister<EventRepository>();
  }

  void _navigateToAddEvent() {
    TNavigationService.toNamed(TAppRoutes.addEvent);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = TDeviceUtils.getScreenBodyHeight();
    screenWidth = TDeviceUtils.getScreenWidth();
    isDarkMode = TDeviceUtils.isDarkMode();

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Events",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: isDarkMode
                            ? TColors.primaryDark
                            : TColors.primary,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultScreenPadding),
            child: Column(
              children: [
                AdminHomeActionButtons(
                  label: "View Events",
                  onPress: () {},
                ),
                AdminHomeActionButtons(
                  label: "Drafts",
                  onPress: () {},
                ),
                AdminHomeActionButtons(
                  label: "+ Add Events",
                  onPress: _navigateToAddEvent,
                  type: AdminButtonType.special,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
