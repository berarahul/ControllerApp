//
//
//
// import 'package:controller/model/DepartmentCard/allDepartmentModel.dart';
// import 'package:get/get.dart';
// import '../ApiServiceForPrimaryDept.dart';
//
// class DepartmentControllerForPrimary extends GetxController {
//   var departments = <AllDepartmentModel>[].obs;
//   var secondDepartments = <AllDepartmentModel>[].obs;
//   var selectedDepartment = Rx<AllDepartmentModel?>(null);
//   var selectedSecondDepartment = Rx<AllDepartmentModel?>(null);
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchDepartments();
//   }
//
//   void fetchDepartments() async {
//     var departmentData = await ApiServiceForPrimaryDept.fetchDepartments();
//     if (departmentData != null) {
//       departments.value = departmentData;
//     }
//   }
//
//   void fetchSecondDepartments(int teacherId) async {
//     var secondDepartmentData = await ApiServiceForPrimaryDept.fetchSecondDepartments(teacherId);
//     if (secondDepartmentData != null) {
//       secondDepartments.value = secondDepartmentData;
//     }
//   }
//
//   void onDepartmentChanged(AllDepartmentModel? newDepartment) {
//     selectedDepartment.value = newDepartment;
//     selectedSecondDepartment.value = null; // Reset second department selection
//     if (newDepartment != null) {
//       // Fetch second departments when a new department is selected
//       fetchSecondDepartments(newDepartment.id);
//     }
//   }
//
//   void onSecondDepartmentChanged(AllDepartmentModel? newSecondDepartment) {
//     selectedSecondDepartment.value = newSecondDepartment;
//     // Optionally, you can fetch related data for the second department here
//   }
//
//   int? getSelectedSecondDepartmentId() {
//     return selectedSecondDepartment.value?.id;
//   }
// }


import 'package:get/get.dart';
import '../../../../../model/DepartmentCard/allDepartmentModel.dart';
import '../../../../../model/DepartmentCard/allTeacherModel.dart';
import '../ApiServiceForPrimaryDept.dart';
import 'TeacherDropdownForPrimaryController.dart';

class DepartmentControllerForPrimary extends GetxController {
  var departments = <AllDepartmentModel>[].obs;
  var secondDepartments = <AllDepartmentModel>[].obs;
  var selectedDepartment = Rx<AllDepartmentModel?>(null);
  var selectedSecondDepartment = Rx<AllDepartmentModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchDepartments();
  }

  void fetchDepartments() async {
    var departmentData = await ApiServiceForPrimaryDept.fetchDepartments();
    if (departmentData != null) {
      departments.value = departmentData;
    }
  }

  // Fetch second departments based on teacher ID
  void fetchSecondDepartments(int teacherId) async {
    var secondDepartmentData = await ApiServiceForPrimaryDept.fetchSecondDepartments(teacherId);
    if (secondDepartmentData != null) {
      secondDepartments.value = secondDepartmentData;
      // Reset selected second department when fetching new data
      selectedSecondDepartment.value = null;
    }
  }

  // Handle department change
  void onDepartmentChanged(AllDepartmentModel? newDepartment) {
    selectedDepartment.value = newDepartment;
    if (newDepartment != null) {
      // Fetch teachers for the selected department
      Get.find<TeacherControllerForPrimary>().fetchTeachers(newDepartment.id);
      // Optionally handle other actions related to department change
    } else {
      // Clear the second departments if no department is selected
      secondDepartments.value = [];
      selectedSecondDepartment.value = null;
    }
  }

  // Handle teacher change
  void onTeacherChanged(AllTeacherModel? newTeacher) {
    if (newTeacher != null) {
      fetchSecondDepartments(newTeacher.teacherId);
    } else {
      // Clear the second departments if no teacher is selected
      secondDepartments.value = [];
      selectedSecondDepartment.value = null;
    }
  }

  int? getSelectedSecondDepartmentId() {
    return selectedSecondDepartment.value?.id;
  }
}
