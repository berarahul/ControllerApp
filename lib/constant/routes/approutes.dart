// lib/routes/app_routes.dart
import 'package:get/get.dart';

import '../../view/Screens/ControllerScreen/ControllerScreen.dart';
import '../../view/Screens/DepartmentCard/DepartmentScreen.dart';
import '../../view/Screens/HODCard/ChangeHodScreen.dart';
import '../../view/Screens/Login/Login_Screen.dart';
import '../../view/Screens/holidayCard/holidayScreen.dart';
import '../../view/Screens/pendingRequestCard/Teacher management.dart';
import '../../view/Screens/pendingRequestCard/pendingTeacherList.dart';

// import other screens as needed

class AppRoutes {
  static const String login = '/login';
  static const String controller = '/controller';
  static const String Pendingrequest = '/Pendingrequest';
  static const String Department = '/Department';
  static const String HOD = '/HOD';
  static const String holiday = '/holiday';
  // static const String subject = '/subject';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: controller, page: () => Controllerscreen()),
    GetPage(name: Pendingrequest, page: () => TeacherControllerActionsScreen()),
    GetPage(name: Department, page: () => DepartmentActionsScreen()),
    GetPage(name: HOD, page: () => ChangeHodScreen()),
    GetPage(name: holiday, page: () => HolidayActionsScreen()),
    // GetPage(name: holiday, page: () => StudentActionsScreen()),
    // Ensure these screens are implemented
    // GetPage(name: teacher, page: () => TeacherActionsScreen()),
    // GetPage(name: subject, page: () => SubjectActionScreen()),
  ];
}
