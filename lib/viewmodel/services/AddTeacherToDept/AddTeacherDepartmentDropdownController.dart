// hod_dropdown_controller.dart
import 'package:controller/model/DepartmentCard/allDepartmentModel.dart';
import 'package:controller/viewmodel/services/DepartmentServices/Delete/DepartmentService.dart';
import 'package:get/get.dart';

class Addteacherdepartmentdropdowncontroller extends GetxController {
  var departments = <AllDepartmentModel>[].obs;
  var selectedDepartment = Rx<AllDepartmentModel?>(null);
  var isLoading = false.obs;

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

  void updateSelectedDepartment(int? departmentId) {
    selectedDepartment.value = departments
        .firstWhere((dept) => dept.id == departmentId, orElse: () => null!);
  }
}
