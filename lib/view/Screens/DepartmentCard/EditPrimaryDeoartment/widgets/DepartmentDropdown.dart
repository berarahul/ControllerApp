// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../model/DepartmentCard/allDepartmentModel.dart';
// import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/DepartmentDropdownControllerForPrimary.dart';
// import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/TeacherDropdownForPrimaryController.dart';
//
//
// class DepartmentDropdownForPrimary extends StatelessWidget {
//   final DepartmentControllerForPrimary departmentController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return DropdownButton<AllDepartmentModel>(
//         hint: const Text('Select Department'),
//         value: departmentController.selectedDepartment.value,
//         onChanged: (value) {
//           departmentController.selectedDepartment.value = value;
//           Get.find<TeacherControllerForPrimary>().fetchTeachers(value!.id);
//         },
//         items: departmentController.departments.map((AllDepartmentModel department) {
//           return DropdownMenuItem<AllDepartmentModel>(
//             value: department,
//             child: Text(department.departmentName),
//           );
//         }).toList(),
//       );
//     });
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../model/DepartmentCard/allDepartmentModel.dart';
import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/DepartmentDropdownControllerForPrimary.dart';
import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/TeacherDropdownForPrimaryController.dart';

class DepartmentDropdownForPrimary extends StatelessWidget {
  final DepartmentControllerForPrimary departmentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<AllDepartmentModel>(
            hint: Text(
              'Select Department',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            value: departmentController.selectedDepartment.value,
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
            isExpanded: true,
            onChanged: (value) {
              departmentController.selectedDepartment.value = value;
              Get.find<TeacherControllerForPrimary>().fetchTeachers(value!.id);
            },
            items: departmentController.departments.map((AllDepartmentModel department) {
              return DropdownMenuItem<AllDepartmentModel>(
                value: department,
                child: Text(
                  department.departmentName,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            }).toList(),
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      );
    });
  }
}
