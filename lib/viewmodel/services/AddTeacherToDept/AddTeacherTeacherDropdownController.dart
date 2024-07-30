// import 'dart:convert';
//
// import 'package:controller/model/DepartmentCard/allTeacherModel.dart';
// import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
// import 'package:controller/viewmodel/services/hodServices/TeacherService.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../../../model/DepartmentCard/allDepartmentModel.dart';
// import '../LoginService/AutharizationHeader.dart';
// import 'TeacherServiceForAddTeacher.dart';
//
// // Update the import as needed
//
// class Addteacherteacherdropdowncontroller extends GetxController {
//   var teachers = <AllTeacherModel>[].obs;
//   var selectedteachers = Rxn<AllTeacherModel>();
//   var isLoading = false.obs;
//   var departmentIds = <int>[].obs;
//   int departmentId = 0;
//   @override
//   void onInit() {
//
//     super.onInit();
//   }
//
//
//   Future<void> fetchTeacherss(int dept) async {
//
//
//     departmentId = dept;
//     isLoading.value = true;
//     try {
//       final List<AllTeacherModel> teacherList = await TeacherServiceforAddTeacher.fetchTeachers(dept);
//       teachers.value = teacherList;
//       print(teacherList);
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to fetch Teachers');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void setSelectedTeacher(AllTeacherModel? teacher) {
//     selectedteachers.value = teacher;
//   }
//
//
//
//
//
//
//
//   Future<void> AddTeacher() async {
//     ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
//     final headers = await apiHelper.getHeaders();
//
//     if (selectedteachers.value == null) {
//       Get.snackbar('Error', 'Please select a Teacher to Add');
//       return;
//     }
//
//     isLoading.value = true;
//     try {
//       final requestBody = jsonEncode({
//         'teacherId': selectedteachers.value!.teacherId,
//         'addDept': [departmentId],
//       });
//
//       // Print the request body
//       print("Request Body: $requestBody");
//
//       final response = await http.put(
//         Uri.parse('https://attendancesystem-s1.onrender.com/api/controller/changeDepartment'),
//         headers: headers,
//         body: requestBody,
//       );
//
//       if (response.statusCode != 200) {
//         print("Response Body: ${response.body}");
//         print("Response Status Code: ${response.statusCode}");
//         throw Exception('Failed to remove teacher');
//       }
//
//       teachers.remove(selectedteachers.value);
//       setSelectedTeacher(null);
//       Get.snackbar('Success', 'Teacher Added successfully');
//     } catch (e) {
//       print(e);
//       Get.snackbar('Error', 'Failed to Add Teacher');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
// }
//

import 'dart:convert';
import 'package:controller/model/DepartmentCard/allTeacherModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../model/DepartmentCard/allDepartmentModel.dart';
import '../LoginService/AutharizationHeader.dart';
import 'SecondtimeAddTeacherDepartmentDropdownController.dart';
import 'TeacherServiceForAddTeacher.dart';

class Addteacherteacherdropdowncontroller extends GetxController {
  var teachers = <AllTeacherModel>[].obs;
  var selectedTeachers = Rxn<AllTeacherModel>();
  var isLoading = false.obs;

  final Secondtimeaddteacherdepartmentdropdowncontroller
      departmentDropdownController =
      Get.put(Secondtimeaddteacherdepartmentdropdowncontroller());

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchTeachers(int dept) async {
    isLoading.value = true;
    try {
      final List<AllTeacherModel> teacherList =
          await TeacherServiceforAddTeacher.fetchTeachers(dept);
      teachers.value = teacherList;
      print(teacherList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch Teachers');
    } finally {
      isLoading.value = false;
    }
  }

  void setSelectedTeacher(AllTeacherModel? teacher) {
    selectedTeachers.value = teacher;
  }

  Future<void> AddTeacher() async {
    ApiHelper apiHelper = ApiHelper();
    final headers = await apiHelper.getHeaders();

    if (selectedTeachers.value == null) {
      Get.snackbar('Error', 'Please select a Teacher to Add');
      return;
    }

    isLoading.value = true;
    try {
      final selectedDepartmentIds = departmentDropdownController
          .selectedDepartments
          .map((department) => department.id)
          .toList();
      final requestBody = jsonEncode({
        'teacherId': selectedTeachers.value!.teacherId,
        'addDept': selectedDepartmentIds,
      });

      // Print the request body
      print("Request Body: $requestBody");

      final response = await http.put(
        Uri.parse(
            'https://attendancesystem-s1.onrender.com/api/controller/changeDepartment'),
        headers: headers,
        body: requestBody,
      );

      if (response.statusCode != 200) {
        print("Response Body: ${response.body}");
        print("Response Status Code: ${response.statusCode}");
        throw Exception('Failed to add teacher');
      }

      // teachers.remove(selectedTeachers.value);
      setSelectedTeacher(null);
      Get.snackbar('Success', 'Teacher added successfully');
      departmentDropdownController.clearSelectedDepartments();
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to add Teacher');
    } finally {
      isLoading.value = false;
    }
  }
}
