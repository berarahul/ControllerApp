import 'package:controller/constant/AppColors.dart';
import 'package:controller/constant/RoundButton.dart';
import 'package:controller/viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'departmentDropdownWidget.dart';

class DeleteDepartmentScreen extends StatelessWidget {
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    // Initialize DepartmentController
    DeleteDepartmentController controller = Get.put(DeleteDepartmentController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Delete Department'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DepartmentDropdown(), // Use the dropdown widget here
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    isLoading.value = true; // Start loading indicator
                    controller.deleteDepartment().then((_) {
                      isLoading.value = false; // Stop loading indicator when done
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Obx(() => isLoading.value
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text('Delete', style: TextStyle(fontSize: 16))),
                ),
                // Other widgets or functionality here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
