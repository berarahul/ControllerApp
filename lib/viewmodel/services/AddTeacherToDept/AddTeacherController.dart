import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Update the import as needed

class TeacherAddController extends GetxController {
  var selectedDepartmentId = 0.obs;

  var isLoading = false.obs;

  void setSelectedDepartment(int departmentId) {
    selectedDepartmentId.value = departmentId;
  }
}
