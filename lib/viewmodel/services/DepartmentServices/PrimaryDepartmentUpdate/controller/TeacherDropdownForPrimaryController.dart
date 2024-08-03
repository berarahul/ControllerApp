// import 'package:get/get.dart';
//
//
// import '../../../../../model/DepartmentCard/allTeacherModel.dart';
// import '../ApiServiceForPrimaryDept.dart';
//
// class TeacherControllerForPrimary extends GetxController {
//   var teachers = <AllTeacherModel>[].obs;
//   var selectedTeacher = Rx<AllTeacherModel?>(null);
//
//   void fetchTeachers(int departmentId) async {
//     var teacherData = await ApiServiceForPrimaryDept.fetchTeachers(departmentId);
//     if (teacherData != null) {
//       teachers.value = teacherData;
//     }
//   }
//
//   int? getSelectedTeacherId() {
//     // Check if a teacher is selected and return the ID
//     return selectedTeacher.value?.teacherId;
//   }
//
//
// }
//
//


import 'package:get/get.dart';
import '../../../../../model/DepartmentCard/allTeacherModel.dart';
import '../ApiServiceForPrimaryDept.dart';

class TeacherControllerForPrimary extends GetxController {
  var teachers = <AllTeacherModel>[].obs;
  var selectedTeacher = Rx<AllTeacherModel?>(null);

  // Fetch teachers based on department ID
  void fetchTeachers(int departmentId) async {
    var teacherData = await ApiServiceForPrimaryDept.fetchTeachers(departmentId);
    if (teacherData != null) {
      teachers.value = teacherData;
      selectedTeacher.value = null; // Reset selected teacher when fetching new data
    }
  }

  // Get the ID of the currently selected teacher
  int? getSelectedTeacherId() {
    return selectedTeacher.value?.teacherId;
  }

  // Handle changes in the selected teacher
  void onTeacherChanged(AllTeacherModel? newTeacher) {
    selectedTeacher.value = newTeacher;
  }
}
