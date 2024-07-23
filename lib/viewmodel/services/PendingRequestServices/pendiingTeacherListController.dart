import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../data/response/api_response.dart';
import '../../../model/approveTeaher/Department/DepartmentModel.dart';
import '../../../model/teacherlist/TeacherListModel.dart';

class TeacherController extends GetxController {
  var teachers = <Teacher>[].obs;
  var isLoading = true.obs;
ApiHelper apiHelper=ApiHelper();
  @override
  void onInit() {
    fetchTeachers();
    super.onInit();
  }

  void fetchTeachers() async {
    try {
      isLoading.value = true;
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
    finally {
      isLoading.value = false; // Set loading to false
    }
  }

  void removeTeacher(Teacher teacher) {
    teachers.remove(teacher);
  }


  Future<ApiResponse> addDepartmentsToTeacher(Map<String, dynamic> requestBody) async {
    final headers = await apiHelper.getHeaders();
    try {
      final response = await http.post(
        Uri.parse('https://attendancesystem-s1.onrender.com/api/controller/approveTeacher'),
        headers: headers,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        print("success");
        // Get.snackbar("Success", "Registration successfully submitted");
        return ApiResponse(isSuccess: true);

      } else {
        return ApiResponse(isSuccess: false);
      }
    } catch (e) {
      return ApiResponse(isSuccess: false);
    }
  }


  Future<void> rejectTeacher(int teacherId) async {
    try {
      final headers = await apiHelper.getHeaders(); // Get headers with token
      final response = await ApiHelper.delete('controller/rejectTeacher?teacherId=$teacherId', headers: headers); // Perform DELETE request with headers

      if (response.statusCode == 200) {
        // Remove the teacher from the list after a successful API call
        teachers.removeWhere((teacher) => teacher.id == teacherId);
        Get.snackbar('Success', 'Teacher rejected successfully');
      } else {
        Get.snackbar('Error', 'Failed to reject teacher');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
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
    final response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      departments.value = data.map((json) => Department.fromJson(json)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load departments');
    }
  }
}
class ApiResponse {
  final bool isSuccess;

  ApiResponse({required this.isSuccess});

}

// Add this method for making the API call
