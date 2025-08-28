import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/buttons/admin/admin_home_actionbutton.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/domain/repositories/api/animal_api_repository.dart';
import 'package:mobile_app_template/domain/repositories/local/local_animal_repository.dart';
import 'package:mobile_app_template/network/dio/app_dio.dart';
import 'package:mobile_app_template/network/dio/dio_network_client.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class AnimalDatabaseScreen extends StatefulWidget {
  const AnimalDatabaseScreen({super.key});

  @override
  State<AnimalDatabaseScreen> createState() => _AnimalDatabaseScreenState();
}
class _AnimalDatabaseScreenState extends State<AnimalDatabaseScreen> {

  @override
  void initState(){
    super.initState();

    final localAnimalService = LocalAnimalRepository(getIt<Isar>());

    final animalApiService = AnimalApiRepository();
    animalApiService.init(DioNetworkClient(AppDio().dio));

    getIt.registerLazySingleton(
      ()=> AnimalDatabaseService(
        animalApiService: animalApiService, 
        localAnimalRepo: localAnimalService)
      );

  }

  @override
  void dispose(){
    getIt.unregister<AnimalDatabaseService>();
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

  void _navigateToViewDrafts(){
    TNavigationService.toNamed(TAppRoutes.viewDrafts);
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
                  onPress: _navigateToViewDrafts,
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
