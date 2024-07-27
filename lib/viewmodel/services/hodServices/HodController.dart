import 'package:get/get.dart';


import 'ChangeHodApiServices.dart'; // Update the import as needed

class HodController extends GetxController {
  var selectedDepartmentId = 0.obs;
  var currentHod = ''.obs;
  var isLoading = false.obs;

  void setSelectedDepartment(int departmentId) {
    selectedDepartmentId.value = departmentId;
    fetchCurrentHod(departmentId);
  }

  void fetchCurrentHod(int departmentId) async {
    isLoading.value = true;
    try {
      currentHod.value = await HodService.fetchCurrentHod(departmentId);
    } catch (e) {
      print('Error fetching current HOD: $e'); // Print the actual error
      currentHod.value = 'Currently There is no HOD';
    } finally {
      isLoading.value = false;
    }
  }

}
