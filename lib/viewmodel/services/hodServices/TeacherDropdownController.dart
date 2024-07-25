import 'package:controller/model/DepartmentCard/allTeacherModel.dart';
import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
import 'package:controller/viewmodel/services/hodServices/TeacherService.dart';
import 'package:get/get.dart';

import '../../../../model/DepartmentCard/allDepartmentModel.dart';

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


}

