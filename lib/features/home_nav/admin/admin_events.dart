import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/buttons/admin/admin_home_actionbutton.dart';
import 'package:mobile_app_template/core/widgets/dialogs/async_generic_loader/async_generic_loader.dart';
import 'package:mobile_app_template/domain/repositories/event_repository.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AdminEventsScreens extends StatefulWidget {
  const AdminEventsScreens({super.key});

  @override
  State<AdminEventsScreens> createState() => _AdminEventsScreensState();
}

class _AdminEventsScreensState extends State<AdminEventsScreens> {

  @override
  void initState() {
    super.initState();
    getIt.registerLazySingleton<EventRepository>(()=>EventRepository(getIt.get<Isar>()));
  }

  @override
  void dispose(){
    super.dispose();
    getIt.unregister<EventRepository>();
  }

  void _navigateToAddEvent() {
    TNavigationService.toNamed(TAppRoutes.addEvent);
  }

  void _navigateToViewEvent(){
    TNavigationService.toNamed(TAppRoutes.viewEvents);
  }

  Future<OperationResponse> waitSomeTime({int seconds = 2}) async {
    await Future.delayed(Duration(seconds: seconds));
    
    // return OperationResponse.successfulResponse();
    throw Exception("Failed");
  }


  void _showTrialDialog(){
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      content: AsyncGenericLoader(asyncFunction: waitSomeTime)
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = TDeviceUtils.getScreenBodyHeight();
    double screenWidth = TDeviceUtils.getScreenWidth();
    bool isDarkMode = TDeviceUtils.isDarkMode();

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
                  onPress: _navigateToViewEvent,
                ),
                AdminHomeActionButtons(
                  label: "Drafts",
                  onPress: _showTrialDialog,
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
