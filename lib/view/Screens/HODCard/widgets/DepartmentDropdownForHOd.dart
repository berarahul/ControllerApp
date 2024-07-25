//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';
//
// class DepartmentDropdownHOD extends StatelessWidget {
//   final Function(int?)? onChanged;
//
//   DepartmentDropdownHOD({this.onChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     final DeleteDepartmentController departmentController = Get.find();
//
//     return Obx(() {
//       if (departmentController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       return DropdownButton<int>(
//         hint: const Text('Select Department'),
//         value: departmentController.selectedDepartment.value?.id,
//         onChanged: onChanged,
//         items: departmentController.departments.map((department) {
//           return DropdownMenuItem<int>(
//             value: department.id,
//             child: Text(department.departmentName),
//           );
//         }).toList(),
//       );
//     });
//   }
// }
//
//
//
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';
import '../../../../viewmodel/services/hodServices/HodDropdownController.dart';

class DepartmentDropdownHOD extends StatelessWidget {
  final Function(int?)? onChanged;

  DepartmentDropdownHOD({this.onChanged});

  @override
  Widget build(BuildContext context) {
    final Hoddropdowncontroller departmentController = Get.find();

    return Obx(() {
      if (departmentController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return DropdownButton<int>(
        hint: const Text('Select Department'),
        value: departmentController.selectedDepartment.value?.id,
        onChanged: (int? newValue) {
          departmentController.updateSelectedDepartment(newValue);
          if (onChanged != null) {
            onChanged!(newValue);
          }
        },
        items: departmentController.departments.map((department) {
          return DropdownMenuItem<int>(
            value: department.id,
            child: Text(department.departmentName),
          );
        }).toList(),
      );
    });
  }
}
