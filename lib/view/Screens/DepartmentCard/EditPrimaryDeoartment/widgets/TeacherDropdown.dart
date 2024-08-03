//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../model/DepartmentCard/allTeacherModel.dart';
// import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/DepartmentDropdownControllerForPrimary.dart';
// import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/TeacherDropdownForPrimaryController.dart';
//
// class TeacherDropdownForPrimary extends StatelessWidget {
//   final TeacherControllerForPrimary teacherController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       // If no teachers are available, return a default widget
//       if (teacherController.teachers.isEmpty) {
//         return Center(child: Text('No teachers available'));
//       }
//
//       return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.grey),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<AllTeacherModel>(
//             hint: Text(
//               'Select Teacher',
//               style: TextStyle(color: Colors.grey[700], fontSize: 16),
//             ),
//             value: teacherController.selectedTeacher.value,
//             icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
//             isExpanded: true,
//             onChanged: (AllTeacherModel? selectedTeacher) {
//               if (selectedTeacher != null) {
//                 // Update selected teacher and fetch second departments based on the selected teacher
//                 teacherController.selectedTeacher.value = selectedTeacher;
//                 print('Selected Teacher ID: ${selectedTeacher.teacherId}');
//                 Get.find<DepartmentControllerForPrimary>().fetchSecondDepartments(selectedTeacher.teacherId);
//               } else {
//                 // Handle the case where selectedTeacher is null (optional)
//                 print('Selected teacher is null');
//               }
//             },
//             items: teacherController.teachers.map((AllTeacherModel teacher) {
//               return DropdownMenuItem<AllTeacherModel>(
//                 value: teacher,
//                 child: Text(
//                   teacher.name,
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               );
//             }).toList(),
//             dropdownColor: Colors.white,
//             style: TextStyle(color: Colors.black, fontSize: 16),
//           ),
//         ),
//       );
//     });
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../model/DepartmentCard/allTeacherModel.dart';
import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/DepartmentDropdownControllerForPrimary.dart';
import '../../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/TeacherDropdownForPrimaryController.dart';

class TeacherDropdownForPrimary extends StatelessWidget {
  final TeacherControllerForPrimary teacherController = Get.find();
  final DepartmentControllerForPrimary departmentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // if (teacherController.teachers.isEmpty) {
      //   return const Center(child: Text('Please select Department'));
      // }

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
          child: DropdownButton<AllTeacherModel>(
            hint: Text(
              'Select Teacher',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            value: teacherController.selectedTeacher.value,
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
            isExpanded: true,
            onChanged: (AllTeacherModel? selectedTeacher) {
              if (selectedTeacher != null) {
                teacherController.onTeacherChanged(selectedTeacher);
                departmentController.onTeacherChanged(selectedTeacher);
                teacherController.selectedTeacher.value = selectedTeacher;
                print('Selected Teacher ID: ${selectedTeacher.teacherId}');
                departmentController.fetchSecondDepartments(selectedTeacher.teacherId);
              } else {
                print('Selected teacher is null');
              }
            },
            items: teacherController.teachers.map((AllTeacherModel teacher) {
              return DropdownMenuItem<AllTeacherModel>(
                value: teacher,
                child: Text(
                  teacher.name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            }).toList(),
            dropdownColor: Colors.white,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      );
    });
  }
}
