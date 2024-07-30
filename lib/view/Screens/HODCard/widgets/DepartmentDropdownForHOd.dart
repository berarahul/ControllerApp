import 'package:controller/viewmodel/services/hodServices/TeacherDropdownController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewmodel/services/hodServices/HodDropdownController.dart';

class DepartmentDropdownHOD extends StatelessWidget {
  final Function(int?)? onChanged;

  DepartmentDropdownHOD({this.onChanged});

  @override
  Widget build(BuildContext context) {
    final Hoddropdowncontroller departmentController = Get.find();
    Teacherdropdowncontroller teacherdropdowncontroller = Get.put(Teacherdropdowncontroller());

    return Obx(() {
      if (departmentController.isLoading.value) {
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
          child: DropdownButton<int>(
            hint: const Text('Select Department', style: TextStyle(color: Colors.black)),
            value: departmentController.selectedDepartment.value?.id,
            onChanged: (int? newValue) {
              teacherdropdowncontroller.fetchTeacherss(newValue!);
              departmentController.updateSelectedDepartment(newValue);
              if (onChanged != null) {
                onChanged!(newValue);
              }
            },
            items: departmentController.departments.map((department) {
              return DropdownMenuItem<int>(
                value: department.id,
                child: Text(
                  department.departmentName,
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
