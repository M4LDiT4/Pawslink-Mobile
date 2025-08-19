import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/buttons/admin/admin_home_actionbutton.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/services/api/animal_api.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AnimalDatabaseScreen extends StatefulWidget {
  const AnimalDatabaseScreen({super.key});

  @override
  State<AnimalDatabaseScreen> createState() => _AnimalDatabaseScreenState();
}
class _AnimalDatabaseScreenState extends State<AnimalDatabaseScreen> {

  @override
  void initState(){
    super.initState();
    //register the animal repository in the service locator
    //inject the isar dependency
    getIt.registerLazySingleton(()=> AnimalRepository(getIt<Isar>()));

    AnimalApi animalAPI = AnimalApi();
    animalAPI.init();
    getIt.registerLazySingleton(() => animalAPI);
  }

  @override
  void dispose(){
    getIt.unregister<AnimalRepository>();
    getIt.unregister<AnimalApi>();
    super.dispose();
  }

  void _navigateToAddAnimal() {
    TNavigationService.toNamed(TAppRoutes.addAnimal);
  }

  void _navigateToViewAnimal() {
    TNavigationService.toNamed(TAppRoutes.viewAnimal);
  }

  void _navigateToScanQrCode() {
    TNavigationService.toNamed(TAppRoutes.qrCodeScanner);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = TDeviceUtils.getScreenBodyHeight();
    final screenWidth = TDeviceUtils.getScreenWidth();
    final isDarkMode = TDeviceUtils.isDarkMode();

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
                  "Animal Database",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: isDarkMode ? TColors.primaryDark : TColors.primary,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
            child: Column(
              children: [
                AdminHomeActionButtons(
                  label: "View Animals",
                  onPress: _navigateToViewAnimal,
                ),
                AdminHomeActionButtons(
                  label: "View Drafts",
                  onPress: () {},
                ),
                AdminHomeActionButtons(
                  onPress: _navigateToScanQrCode,
                  label: "Scan",
                ),
                AdminHomeActionButtons(
                  label: "+ Add Animal",
                  onPress: _navigateToAddAnimal,
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
