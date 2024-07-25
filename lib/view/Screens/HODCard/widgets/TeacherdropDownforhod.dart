// teacher_dropdown.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../viewmodel/services/hodServices/TeacherDropdownController.dart';

class TeacherDropdown extends StatelessWidget {
  final Function(int?)? onChanged;

  TeacherDropdown({this.onChanged});

  @override
  Widget build(BuildContext context) {
    final TeacherControllerHOD teacherController = Get.find();

    return Obx(() {
      if (teacherController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return DropdownButton<int>(
        hint: const Text('Select Teacher'),
        value: teacherController.selectedTeacher.value?.teacherId == -1
            ? null
            : teacherController.selectedTeacher.value?.teacherId,
        onChanged: (int? newValue) {
          teacherController.updateSelectedTeacher(newValue);
          if (onChanged != null) {
            onChanged!(newValue);
          }
        },
        items: teacherController.teachers.map((teacher) {
          return DropdownMenuItem<int>(
            value: teacher.teacherId,
            child: Text(teacher.name),
          );
        }).toList(),
      );
    });
  }
}
