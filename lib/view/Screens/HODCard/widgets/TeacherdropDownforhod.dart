import 'package:controller/model/DepartmentCard/allTeacherModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/DepartmentCard/allDepartmentModel.dart';
import '../../../../viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';
import '../../../../viewmodel/services/hodServices/TeacherDropdownController.dart';

class TeacherDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Teacherdropdowncontroller TeacherController = Get.find();

    return Obx(() {
      if (TeacherController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<AllTeacherModel>(
            hint: const Text('Select Teacher', style: TextStyle(color: Colors.black)),
            value: TeacherController.selectedteachers.value,
            onChanged: (AllTeacherModel? newValue) {
              TeacherController.selectedteachers(newValue);
            },
            items: TeacherController.teachers.map((AllTeacherModel teacher) {
              return DropdownMenuItem<AllTeacherModel>(
                value: teacher,
                child: Text(
                  teacher.name,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            isExpanded: true,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      );
    });
  }
}

