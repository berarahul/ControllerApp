import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/DepartmentCard/allDepartmentModel.dart';
import '../../../../viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';

class DepartmentDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeleteDepartmentController departmentController = Get.find();

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
          child: DropdownButton<AllDepartmentModel>(
            hint: const Text('Select Department', style: TextStyle(color: Colors.black)),
            value: departmentController.selectedDepartment.value,
            onChanged: (AllDepartmentModel? newValue) {
              departmentController.setSelectedDepartment(newValue);
            },
            items: departmentController.departments.map((AllDepartmentModel department) {
              return DropdownMenuItem<AllDepartmentModel>(
                value: department,
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

