import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/approveTeaher/Department/DepartmentModel.dart';
import '../../../model/teacherlist/TeacherListModel.dart';
import '../../../viewmodel/services/PendingRequestServices/pendiingTeacherListController.dart';

class TeacherListScreen extends StatelessWidget {
  final TeacherController teacherController = Get.put(TeacherController());
  final DepartmentController departmentController = Get.put(DepartmentController());

  void _showDepartmentSelectionDialog(BuildContext context, Teacher teacher) {
    Get.dialog(
      AlertDialog(
        title: Text('Select Department'),
        content: Container(
          width: double.minPositive,
          child: Obx(() {
            if (departmentController.departments.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: departmentController.departments.length,
                itemBuilder: (context, index) {
                  Department department = departmentController.departments[index];
                  return ListTile(
                    title: Text(department.name),
                    onTap: () {
                      teacherController.removeTeacher(teacher);
                      Get.back();
                    },
                  );
                },
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
        title: Text('Teacher List'),
      ),
      body: Obx(() {
        if (teacherController.teachers.isEmpty) {
          return Center(child: CircularProgressIndicator());
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
