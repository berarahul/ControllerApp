


import 'package:controller/model/DepartmentCard/allDepartmentModel.dart';
import 'package:controller/viewmodel/services/DepartmentServices/Delete/DepartmentService.dart';
import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'TeacherDropdownForPrimaryController.dart';

class SecondTimeDepartmentDropdownForPrimaryController extends GetxController {
  var departments = <AllDepartmentModel>[].obs;
  var selectedDepartments = <AllDepartmentModel>[].obs;
  var isLoading = false.obs;
  TeacherControllerForPrimary teacherControllerForPrimary=Get.put(TeacherControllerForPrimary());
  @override
  void onInit() {
    fetchDepartments();
    super.onInit();
  }

  void fetchDepartments() async {
    isLoading.value = true;
    try {
      var fetchedDepartments = await DepartmentService.fetchDepartments();
      if (fetchedDepartments != null) {
        departments.value = fetchedDepartments;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editPrimaryDepartment(int teacherId, int deptId) async {
    try {
      // Fetch headers
      var headers = await ApiHelper().getHeaders();

      // Construct the URL with query parameters
      final Uri url = Uri.parse(
          'https://attendancesystem-s1.onrender.com/api/controller/editPrimaryDept?teacherId=$teacherId&deptId=$deptId'
      );

      // Send a PUT request to the API with headers
      final response = await http.put(
        url,
        headers: headers,
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Successful response handling
        Get.snackbar("Success", "Primary Department Updated");
        departments.clear();
        teacherControllerForPrimary.teachers.clear(); // Clear teachers data
        selectedDepartments.clear();
        print('Department edited successfully');
        // Perform any additional actions based on the response
      } else {
        // Handle error responses
        print('Failed to edit department. Status code: ${response.statusCode}');
        // Optionally, handle different status codes differently if needed
      }
    } catch (error) {
      // Handle exceptions
      print('An error occurred: $error');
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  void updateSelectedDepartments(List<int> departmentIds) {
    selectedDepartments.value =
        departments.where((dept) => departmentIds.contains(dept.id)).toList();
  }

  void clearSelectedDepartments() {
    selectedDepartments.clear();
  }
}
