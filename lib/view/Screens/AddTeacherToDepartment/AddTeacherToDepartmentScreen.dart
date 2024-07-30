import 'package:controller/view/Screens/AddTeacherToDepartment/widgets/DepartmentDropdown.dart';
import 'package:controller/view/Screens/AddTeacherToDepartment/widgets/SeconedDepartmentDropdown.dart';
import 'package:controller/view/Screens/AddTeacherToDepartment/widgets/TeacherDropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodel/services/AddTeacherToDept/AddTeacherController.dart';
import '../../../viewmodel/services/AddTeacherToDept/AddTeacherDepartmentDropdownController.dart';
import '../../../viewmodel/services/AddTeacherToDept/AddTeacherTeacherDropdownController.dart';
import '../../../viewmodel/services/AddTeacherToDept/SecondtimeAddTeacherDepartmentDropdownController.dart';
import '../../../viewmodel/services/AddTeacherToDept/secondtimeteacheraddController.dart';



class AddTeacherToDepartmentScreen extends StatelessWidget {

  final TeacherAddController teacherAddController = Get.put(TeacherAddController());

  final SecondTeacherAddController secondTeacherAddController = Get.put(SecondTeacherAddController());

  final Addteacherdepartmentdropdowncontroller deleteController = Get.put(Addteacherdepartmentdropdowncontroller());
  Addteacherteacherdropdowncontroller teacherdropdowncontroller = Get.put(Addteacherteacherdropdowncontroller());
  final Secondtimeaddteacherdepartmentdropdowncontroller secondtimeDepartmentcontroller=Get.put(Secondtimeaddteacherdepartmentdropdowncontroller());
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Teacher Add to Another Department'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddTeacherDepartmentDropdown(
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      teacherAddController.setSelectedDepartment(newValue);
                    }
                  },
                ),
                const SizedBox(height: 30,),
                AddTeacherDropdown(),
                const SizedBox(height: 30),
                SecondAddTeacherMultiSelectDropdown(
                  onChanged: (List<int>? newValues) {
                    if (newValues != null) {

                      secondtimeDepartmentcontroller.updateSelectedDepartments(newValues);
                    }
                  },
                ),
                const SizedBox(height: 30),
                Obx(() => ElevatedButton(
                  onPressed: () {
                    isLoading.value = true; // Start loading indicator
                    teacherdropdowncontroller.AddTeacher().then((_) {
                      isLoading.value = false; // Stop loading indicator when done
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: isLoading.value
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text('Add Teacher', style: TextStyle(fontSize: 16)),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
