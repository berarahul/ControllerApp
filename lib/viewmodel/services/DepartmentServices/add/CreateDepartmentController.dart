// import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
// import 'package:get/get.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class CreateDepartmentController extends GetxController {
//   var departmentName = ''.obs;
//   var isLoading = false.obs;
//   ApiHelper apiHelper=ApiHelper();
//   void setDepartmentName(String name) {
//     departmentName.value = name;
//   }
//
//   Future<void> addDepartment() async {
//     final headers = await apiHelper.getHeaders();
//     if (departmentName.value.isEmpty) {
//       Get.snackbar('Error', 'Department name cannot be empty');
//       return;
//     }
//     isLoading.value = true;
//
//     // Example POST request - replace with your actual API URL
//
//     var requestBody={
//
//       'departmentName': departmentName.value,
//     };
//
//       final response = await ApiHelper.post(
//         'controller/createDepartment',
//         headers: headers,
//         body:
//         requestBody,
//       );
// print(headers);
//
//
//       isLoading.value = false;
//       Get.snackbar("Success", "Department added successfully");
//
//   }
// }


import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../LoginService/AutharizationHeader.dart';


class CreateDepartmentController extends GetxController {
  var departmentName = ''.obs;
  var isLoading = false.obs;
  ApiHelper apiHelper = ApiHelper();

  final formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();

  void setDepartmentName(String name) {
    departmentName.value = name;
  }

  Future<void> addDepartment() async {
    if (departmentName.value.isEmpty) {
      Get.snackbar('Error', 'Department name cannot be empty');
      return;
    }

    final headers = await apiHelper.getHeaders();
    isLoading.value = true;

    var requestBody = {
      'departmentName': departmentName.value,
    };
    final response = await ApiHelper.post(
        'controller/createDepartment',
        headers: headers,
        body:
        requestBody,
      );
print(headers);
isLoading.value=false;
Get.snackbar("Success", "Department Added successfully");
textController.clear();
    //   if (response.statusCode == 200) {
    //     Get.snackbar("Success", "Department added successfully");
    //   }else if (response.statusCode ==500){
    //
    //     Get.snackbar("Error", "This Department Already exists");
    //   }
    //
    //   else {
    //     Get.snackbar("Error", "Failed to add department");
    //     print("Error: ${response.statusCode} - ${response.body}");
    //   }
    // } catch (e) {
    //   isLoading.value = false;
    //   Get.snackbar("Error", "An error occurred: $e");
    //   print("Exception: $e");
    // }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
