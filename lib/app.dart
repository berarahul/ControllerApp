import 'package:controller/theme/Apptheme.dart';
import 'package:controller/view/Screens/ControllerScreen/ControllerScreen.dart';
import 'package:controller/view/Screens/Login/Login_Screen.dart';
import 'package:controller/viewmodel/services/LoginService/AuthServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constant/routes/approutes.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthService authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = authService.isLoggedIn();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // initialRoute: AppRoutes.login,
      home: isLoggedIn ? Controllerscreen() : LoginScreen(),
      getPages: AppRoutes.routes,
    );
  }
}
