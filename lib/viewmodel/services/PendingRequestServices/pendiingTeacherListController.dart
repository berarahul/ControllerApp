import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/approveTeaher/Department/DepartmentModel.dart';
import '../../../model/teacherlist/TeacherListModel.dart';

class TeacherController extends GetxController {
  var teachers = <Teacher>[].obs;
ApiHelper apiHelper=ApiHelper();
  @override
  void onInit() {
    fetchTeachers();
    super.onInit();
  }

  void fetchTeachers() async {
    try {
      final headers = await apiHelper.getHeaders(); // Get headers with token
      final response = await ApiHelper.get('controller/registeredTeacher', headers: headers); // Perform GET request with headers

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        teachers.value = data.map((json) => Teacher.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load teachers');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  void removeTeacher(Teacher teacher) {
    teachers.remove(teacher);
  }
}

class DepartmentController extends GetxController {
  var departments = <Department>[].obs;

  @override
  void onInit() {
    fetchDepartments();
    super.onInit();
  }

  void fetchDepartments() async {
    final response = await http.get(Uri.parse('https://api.example.com/departments'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      departments.value = data.map((json) => Department.fromJson(json)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load departments');
    }
  }
}
