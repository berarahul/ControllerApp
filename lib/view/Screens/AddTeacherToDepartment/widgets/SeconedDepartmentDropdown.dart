// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../viewmodel/services/AddTeacherToDept/SecondtimeAddTeacherDepartmentDropdownController.dart';
//
//
// class SecondAddTeacherDepartmentDropdown extends StatelessWidget {
//   final Function(int?)? onChanged;
//
//   SecondAddTeacherDepartmentDropdown({this.onChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     // final Secondtimeaddteacherdepartmentdropdowncontroller departmentController = Get.find();
// final Secondtimeaddteacherdepartmentdropdowncontroller departmentController =Get.put(Secondtimeaddteacherdepartmentdropdowncontroller());
//
//     return Obx(() {
//       if (departmentController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.0),
//           border: Border.all(color: Colors.grey, width: 1),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<int>(
//             hint: const Text('Select Department', style: TextStyle(color: Colors.black)),
//             value: departmentController.selectedDepartment.value?.id,
//             onChanged: (int? newValue) {
//
//               departmentController.updateSelectedDepartment(newValue);
//               if (onChanged != null) {
//                 onChanged!(newValue);
//               }
//             },
//             items: departmentController.departments.map((department) {
//               return DropdownMenuItem<int>(
//                 value: department.id,
//                 child: Text(
//                   department.departmentName,
//                   style: const TextStyle(color: Colors.black),
//                 ),
//               );
//             }).toList(),
//             isExpanded: true,
//             dropdownColor: Colors.white,
//             icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
//
//
//
//
//
import 'package:controller/constant/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../../viewmodel/services/AddTeacherToDept/SecondtimeAddTeacherDepartmentDropdownController.dart';

class SecondAddTeacherMultiSelectDropdown extends StatelessWidget {
  final Function(List<int>?)? onChanged;

  SecondAddTeacherMultiSelectDropdown({this.onChanged});

  @override
  Widget build(BuildContext context) {
    final Secondtimeaddteacherdepartmentdropdowncontroller departmentController = Get.put(Secondtimeaddteacherdepartmentdropdowncontroller());

    return Obx(() {
      if (departmentController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return MultiSelectDialogField(
        backgroundColor: AppColors.backgroundColor,

        items: departmentController.departments.map((department) {
          return MultiSelectItem<int>(
            department.id,
            department.departmentName,
          );
        }).toList(),
        title: const Text("Select Departments",style: TextStyle(color: Colors.black),),
        selectedColor: Colors.blue,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        buttonIcon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        buttonText: const Text(
          "Select Departments",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        onConfirm: (results) {
          departmentController.updateSelectedDepartments(results);
          print("Selected Departments (onConfirm): $results"); // Print the selected department IDs
          if (onChanged != null) {
            onChanged!(results);
          }

        },
      );
    });
  }
}


