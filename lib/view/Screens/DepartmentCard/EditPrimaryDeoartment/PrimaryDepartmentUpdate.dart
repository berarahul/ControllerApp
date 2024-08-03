//
//
// import 'package:controller/view/Screens/DepartmentCard/EditPrimaryDeoartment/widgets/DepartmentDropdown.dart';
// import 'package:controller/view/Screens/DepartmentCard/EditPrimaryDeoartment/widgets/SecondDepartmentDropdownForPrimary.dart';
// import 'package:controller/view/Screens/DepartmentCard/EditPrimaryDeoartment/widgets/TeacherDropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../constant/RoundButton.dart';
// import '../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/DepartmentDropdownControllerForPrimary.dart';
// import '../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/SecondTimeDepartmentDropdownForPrimaryController.dart';
// import '../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/TeacherDropdownForPrimaryController.dart';
//
// class Primarydepartmentupdate extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final secondTimeDepartmentDropdownForPrimaryController = Get.put(Secondtimedepartmentdropdownforprimarycontroller());
//     final departmentControllerForPrimary = Get.put(DepartmentControllerForPrimary());
//     final teacherControllerForPrimary = Get.put(TeacherControllerForPrimary());
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Change Primary Department'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DepartmentDropdownForPrimary(),
//             const SizedBox(height: 16),
//             TeacherDropdownForPrimary(),
//             const SizedBox(height: 16),
//             SecondDepartmentDropdownForPrimary(),
//             const SizedBox(height: 70),
//             RoundButton(
//                 height: 50,
//                 width: 200,
//                 loading: secondTimeDepartmentDropdownForPrimaryController.isLoading(false),
//                 buttonColor: Colors.blue,
//                 title: "Update",
//                 onPress: () {
//                   secondTimeDepartmentDropdownForPrimaryController.isLoading(true);
//                   final teacherID = teacherControllerForPrimary.getSelectedTeacherId();
//                   final deptId = departmentControllerForPrimary.getSelectedSecondDepartmentId();
//
//                   print('Teacher ID: $teacherID');
//                   print('Department ID: $deptId');
//
//                   if (teacherID != null && deptId != null) {
//                     secondTimeDepartmentDropdownForPrimaryController.editPrimaryDepartment(teacherID, deptId);
//                   } else {
//                     print('Teacher ID or Department ID is null');
//                     Get.snackbar("OOps", "Please Select all Field");
//                   }
//                 }
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:controller/view/Screens/DepartmentCard/EditPrimaryDeoartment/widgets/DepartmentDropdown.dart';
import 'package:controller/view/Screens/DepartmentCard/EditPrimaryDeoartment/widgets/SecondDepartmentDropdownForPrimary.dart';
import 'package:controller/view/Screens/DepartmentCard/EditPrimaryDeoartment/widgets/TeacherDropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/RoundButton.dart';
import '../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/DepartmentDropdownControllerForPrimary.dart';
import '../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/SecondTimeDepartmentDropdownForPrimaryController.dart';
import '../../../../viewmodel/services/DepartmentServices/PrimaryDepartmentUpdate/controller/TeacherDropdownForPrimaryController.dart';


class Primarydepartmentupdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final secondTimeDepartmentDropdownForPrimaryController = Get.put(SecondTimeDepartmentDropdownForPrimaryController());
    final departmentControllerForPrimary = Get.put(DepartmentControllerForPrimary());
    final teacherControllerForPrimary = Get.put(TeacherControllerForPrimary());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Change Primary Department'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DepartmentDropdownForPrimary(),
            const SizedBox(height: 16),
            TeacherDropdownForPrimary(),
            const SizedBox(height: 16),
            SecondDepartmentDropdownForPrimary(),
            const SizedBox(height: 70),
            Obx(() {
              // Show CircularProgressIndicator if loading, otherwise show RoundButton
              return secondTimeDepartmentDropdownForPrimaryController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : RoundButton(
                height: 50,
                width: 200,
                buttonColor: Colors.blue,
                title: "Update",
                onPress: () {
                  final teacherID = teacherControllerForPrimary.getSelectedTeacherId();
                  final deptId = departmentControllerForPrimary.getSelectedSecondDepartmentId();

                  print('Teacher ID: $teacherID');
                  print('Department ID: $deptId');

                  if (teacherID != null && deptId != null) {
                    // Start loading
                    secondTimeDepartmentDropdownForPrimaryController.isLoading.value = true;
                    secondTimeDepartmentDropdownForPrimaryController.editPrimaryDepartment(teacherID, deptId);
                  } else {
                    print('Teacher ID or Department ID is null');
                    Get.snackbar("Oops", "Please Select all Fields");
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
