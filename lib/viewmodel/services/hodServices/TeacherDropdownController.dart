import 'dart:convert';

import 'package:controller/model/DepartmentCard/allTeacherModel.dart';
import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
import 'package:controller/viewmodel/services/hodServices/TeacherService.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../model/DepartmentCard/allDepartmentModel.dart';
import '../LoginService/AutharizationHeader.dart';

// Update the import as needed

class Teacherdropdowncontroller extends GetxController {
  var teachers = <AllTeacherModel>[].obs;
  var selectedteachers = Rxn<AllTeacherModel>();
  var isLoading = false.obs;

  int departmentId = 0;
  @override
  void onInit() {

    super.onInit();
  }


  Future<void> fetchTeacherss(int dept) async {


    departmentId = dept;
    isLoading.value = true;
    try {
      final List<AllTeacherModel> teacherList = await TeacherService.fetchTeachers(dept);
      teachers.value = teacherList;
      print(teacherList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch Teachers');
    } finally {
      isLoading.value = false;
    }
  }

  void setSelectedTeacher(AllTeacherModel? teacher) {
    selectedteachers.value = teacher;
  }

  Future<void> changeHod() async {
    if (selectedteachers.value == null) {
      Get.snackbar('Error', 'Please select a Teacher to Change');
      return;
    }

    isLoading.value = true;
    try {
      await TeacherService.ChangeHOD(selectedteachers.value!.teacherId,departmentId as int);
      teachers.remove(selectedteachers.value);
      setSelectedTeacher(null);
      Get.snackbar('Success', 'HOD change successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to Change HOD');
    } finally {
      isLoading.value = false;
    }

  }

  Future<void> removeTeacher() async {
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();

    if (selectedteachers.value == null) {
      Get.snackbar('Error', 'Please select a Teacher to Remove');
      return;
    }

    isLoading.value = true;
    try {
      final requestBody = jsonEncode({
        'teacherId': selectedteachers.value!.teacherId,
        'removeDept': [departmentId],
      });

      // Print the request body
      print("Request Body: $requestBody");

      final response = await http.put(
        Uri.parse('https://attendancesystem-s1.onrender.com/api/controller/changeDepartment'),
        headers: headers,
        body: requestBody,
      );

      if (response.statusCode != 200) {
        print("Response Body: ${response.body}");
        print("Response Status Code: ${response.statusCode}");
        throw Exception('Failed to remove teacher');
      }

      teachers.remove(selectedteachers.value);
      setSelectedTeacher(null);
      Get.snackbar('Success', 'Teacher removed successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to remove Teacher');
    } finally {
      isLoading.value = false;
    }
  }



}

