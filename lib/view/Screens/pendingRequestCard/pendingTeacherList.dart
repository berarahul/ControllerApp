import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../model/approveTeaher/Department/DepartmentModel.dart';
import '../../../model/teacherlist/TeacherListModel.dart';
import '../../../viewmodel/services/PendingRequestServices/pendiingTeacherListController.dart';

class TeacherListScreen extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  final DepartmentController departmentController =
      Get.put(DepartmentController());

  void _showDepartmentSelectionDialog(BuildContext context, Teacher teacher) {
    // Variable to keep track of selected department
    final selectedDepartment = Rx<Department?>(null);

    Get.dialog(
      AlertDialog(
        title: const Text('Select Department'),
        content: Container(
          width: double.minPositive,
          child: Obx(() {
            if (departmentController.departments.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<Department>(
                    hint: const Text('Select a department'),
                    value: selectedDepartment.value,
                    onChanged: (Department? newValue) {
                      selectedDepartment.value = newValue;
                    },
                    items: departmentController.departments
                        .map((Department department) {
                      return DropdownMenuItem<Department>(
                        value: department,
                        child: Text(department.departmentName!),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: selectedDepartment.value == null
                        ? null
                        : () async {
                            // Prepare the request body
                            final requestBody = {
                              'teacherId': teacher.id,
                              'addDept': [selectedDepartment.value!.id],
                            };
                            print(requestBody);

                            // Make the API call
                            final response = await teacherController
                                .addDepartmentsToTeacher(requestBody);

                            // Immediately close the dialog and remove the teacher from the list
                            Get.back();

                            // Close the dialog
                            teacherController.removeTeacher(teacher);

                            // Optional: Handle error, show a message if necessary
                            if (!response.isSuccess) {
                              Get.snackbar('Error',
                                  'Failed to add department to teacher');
                            }
                          },
                    child: Text('Done'),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Teacher List'),
      ),
      body: Obx(() {
        if (teacherController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (teacherController.teachers.isEmpty) {
          return const Center(child: Text('No pending requests available'));
        } else {
          return ListView.builder(
            itemCount: teacherController.teachers.length,
            itemBuilder: (context, index) {
              Teacher teacher = teacherController.teachers[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 4.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  title: Text(teacher.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Aadhaar Id: ${teacher.idCardNumber}'),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () =>
                            _showDepartmentSelectionDialog(context, teacher),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          teacherController.rejectTeacher(teacher.id);
                          teacherController.removeTeacher(teacher);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
