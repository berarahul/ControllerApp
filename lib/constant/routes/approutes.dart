// lib/routes/app_routes.dart
import 'package:get/get.dart';

import '../../view/Screens/ControllerScreen/ControllerScreen.dart';
import '../../view/Screens/Login/Login_Screen.dart';

// import other screens as needed

class AppRoutes {
  static const String login = '/login';
  static const String controller = '/controller';
  static const String Pendingrequest = '/Pendingrequest';
  static const String holiday = '/holiday';
  static const String Department = '/Department';
  // static const String subject = '/subject';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: controller, page: () => Controllerscreen()),
    // GetPage(name: Pendingrequest, page: () => StudentActionsScreen()),
    // GetPage(name: holiday, page: () => StudentActionsScreen()),
    // Ensure these screens are implemented
    // GetPage(name: teacher, page: () => TeacherActionsScreen()),
    // GetPage(name: subject, page: () => SubjectActionScreen()),
  ];
}
