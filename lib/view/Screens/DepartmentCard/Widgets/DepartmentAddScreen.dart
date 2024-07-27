import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../viewmodel/services/DepartmentServices/add/CreateDepartmentController.dart';

class AddDepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateDepartmentController controller = Get.put(CreateDepartmentController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create Department'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.textController,
                decoration: const InputDecoration(labelText: 'Enter Department Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a department name';
                  }
                  return null;
                },
                onChanged: (value) {
                  controller.setDepartmentName(value);
                },
              ),
              const SizedBox(height: 30),
              Obx(() => Center(
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    if (controller.formKey.currentState?.validate() ?? false) {
                      controller.addDepartment();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Text color
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    elevation: 5, // Elevation
                  ),
                  child: controller.isLoading.value
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                      : Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
