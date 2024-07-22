
import 'package:controller/viewmodel/services/LoginService/AuthServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'constant/networkservice/internetConnectionController.dart';

Future<void>main() async{

  await GetStorage.init();
  Get.put(AuthService());
  runApp( MyApp());
  // Get.put(InternetConnectionController(),permanent: true);

}
