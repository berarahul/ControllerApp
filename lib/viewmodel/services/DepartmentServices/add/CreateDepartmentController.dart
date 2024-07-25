import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateDepartmentController extends GetxController {
  var departmentName = ''.obs;
  var isLoading = false.obs;
  ApiHelper apiHelper=ApiHelper();
  void setDepartmentName(String name) {
    departmentName.value = name;
  }

  Future<void> addDepartment() async {
    final headers = await apiHelper.getHeaders();
    if (departmentName.value.isEmpty) {
      Get.snackbar('Error', 'Department name cannot be empty');
      return;
    }
    isLoading.value = true;

    // Example POST request - replace with your actual API URL

    var requestBody={

      'departmentName': departmentName.value,
    };

      final response = await ApiHelper.post(
        'controller/createDepartment',
        headers: headers,
        body:
        requestBody,
      );
print(headers);
      // if (response.statusCode == 200) {
      //   Get.snackbar('Success', 'Department added successfully');
      //   departmentName.value = ''; // Clear the text field after success
      // } else {
    //     Get.snackbar('Error', 'Failed to add department');
    //   }
    // } catch (e) {
    //   Get.snackbar('Error', 'An error occurred: $e');

      isLoading.value = false;
      Get.snackbar("Success", "Department added successfully");

  }
}
