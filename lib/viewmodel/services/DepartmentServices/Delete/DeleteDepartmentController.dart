import 'package:get/get.dart';

import '../../../../model/DepartmentCard/allDepartmentModel.dart';
import 'DepartmentService.dart';
 // Update the import as needed

class DeleteDepartmentController extends GetxController {
  var departments = <AllDepartmentModel>[].obs;
  var selectedDepartment = Rxn<AllDepartmentModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDepartments();
    super.onInit();
  }

  Future<void> fetchDepartments() async {
    isLoading.value = true;
    try {
      final List<AllDepartmentModel> departmentList = await DepartmentService.fetchDepartments();
      departments.value = departmentList;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch departments');
    } finally {
      isLoading.value = false;
    }
  }

  void setSelectedDepartment(AllDepartmentModel? department) {
    selectedDepartment.value = department;
  }

  Future<void> deleteDepartment() async {
    if (selectedDepartment.value == null) {
      Get.snackbar('Error', 'Please select a department to delete');
      return;
    }

    isLoading.value = true;
    try {
      await DepartmentService.deleteDepartment(selectedDepartment.value!.id);
      departments.remove(selectedDepartment.value);
      setSelectedDepartment(null);
      Get.snackbar('Success', 'Department deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete department');
    } finally {
      isLoading.value = false;
    }
  }



}

