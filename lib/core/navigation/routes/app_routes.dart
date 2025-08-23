///@file : app_routes.dart
///@description : define named routes here

abstract class TAppRoutes {
  static const home = '/admin-home';
  static const profile = '/profile';
  static const settings = '/settings';
  static const login = '/login';
  static const onboarding = "/onboarding";
  static const signup = '/signup';
  static const addAnimal = '/add-animal';
  static const viewAnimal = '/view-animal';
  static const splashScreen ='/';
  static const viewAnimalDetails = "/view-animal/details";
  static const qrCodeScanner = "/animal-database/scan-qr-code";
  static const qrCodeGenerator ="/animal-database/generate-qr-code";
  static const addEvent = "/event/add";
  static const viewEvents = "/event/";
  // Add more routes as needed
}
