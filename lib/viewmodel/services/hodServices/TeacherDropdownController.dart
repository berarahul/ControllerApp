// teacher_controller.dart
import 'package:controller/model/DepartmentCard/allDepartmentModel.dart';
import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
import 'package:get/get.dart';

import '../../../model/DepartmentCard/allTeacherModel.dart';
import 'TeacherService.dart';


class TeacherControllerHOD extends GetxController {
  var teachers = <AllTeacherModel>[].obs;
  var selectedTeacher = Rx<AllTeacherModel?>(null);
  var isLoading = false.obs;

 final Hoddropdowncontroller controller= Hoddropdowncontroller();

  @override
  void onInit() {
    fetchTeachers();
    super.onInit();
  }

  void fetchTeachers() async {
    isLoading.value = true;
    try {
      var fetchedTeachers = await TeacherService().getTeachers(controller.selectedDepartment as AllDepartmentModel);
      if (fetchedTeachers != null) {
        teachers.value = fetchedTeachers;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void updateSelectedTeacher(int? teacherId) {
    selectedTeacher.value = teachers.firstWhere(
          (teacher) => teacher.teacherId == teacherId,
      orElse: () => AllTeacherModel(teacherId: -1, name: 'Unknown'),
    );
  }
}
