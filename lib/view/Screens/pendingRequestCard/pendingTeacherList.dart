import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../model/approveTeaher/Department/DepartmentModel.dart';
import '../../../model/teacherlist/TeacherListModel.dart';
import '../../../viewmodel/services/PendingRequestServices/pendiingTeacherListController.dart';


class TeacherListScreen extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  final DepartmentController departmentController = Get.put(DepartmentController());

  void _showDepartmentSelectionDialog(BuildContext context, Teacher teacher) {
    // List to keep track of selected departments
    final selectedDepartments = <Department>[].obs;

    Get.dialog(
      AlertDialog(
        title: Text('Select Department'),
        content: Container(
          width: double.minPositive,
          child: Obx(() {
            if (departmentController.departments.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: departmentController.departments.length,
                      itemBuilder: (context, index) {
                        Department department = departmentController.departments[index];
                        return Obx(() {
                          return CheckboxListTile(
                            title: Text(department.departmentName!),
                            value: selectedDepartments.contains(department),
                            onChanged: (bool? value) {
                              if (value == true) {
                                selectedDepartments.add(department);
                              } else {
                                selectedDepartments.remove(department);
                              }
                            },
                          );
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Collect the selected department IDs
                      final selectedDepartmentIds = selectedDepartments.map((dept) => dept.id).toList();

                      // Prepare the request body
                      final requestBody = {
                        'teacherId': teacher.id,
                        'addDept': selectedDepartmentIds,
                      };
                      print(requestBody);

                      // Make the API call
                      final response = await teacherController.addDepartmentsToTeacher(requestBody);

                      // Immediately close the dialog and remove the teacher from the list
                      Get.back();

                      // Close the dialog
                      teacherController.removeTeacher(teacher);

                      // Optional: Handle error, show a message if necessary
                      if (!response.isSuccess) {
                        Get.snackbar('Error', 'Failed to add departments to teacher');
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
              return ListTile(
                title: Text(teacher.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () => _showDepartmentSelectionDialog(context, teacher),
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
              );
            },
          );
        }
      }),
    );
  }
}

