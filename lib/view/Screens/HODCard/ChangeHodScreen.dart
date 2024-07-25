import 'package:controller/view/Screens/HODCard/widgets/DepartmentDropdownForHOd.dart';
import 'package:controller/view/Screens/HODCard/widgets/TeacherdropDownforhod.dart';
import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
import 'package:controller/viewmodel/services/hodServices/TeacherDropdownController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Update the import as neededimport '../../../viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';
import '../../../viewmodel/services/DepartmentServices/Delete/DeleteDepartmentController.dart';
import '../../../viewmodel/services/hodServices/HodController.dart';
import '../DepartmentCard/Widgets/departmentDropdownWidget.dart';

class ChangeHodScreen extends StatelessWidget {
  final HodController hodController = Get.put(HodController());
  final Hoddropdowncontroller deleteController = Get.put(Hoddropdowncontroller());
Teacherdropdowncontroller teacherdropdowncontroller = Get.put(Teacherdropdowncontroller());
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Change HOD'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DepartmentDropdownHOD(
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      hodController.setSelectedDepartment(newValue);
                    }
                  },
                ),
                SizedBox(height: 20,),
                Obx(() {
                  if (hodController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    'Current HOD: ${hodController.currentHod.value}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  );
                }),
                SizedBox(height: 20,),

                TeacherDropdown(),

                const SizedBox(height: 20),

                const SizedBox(height: 16),
                Obx(() => ElevatedButton(
                  onPressed: () {
                    isLoading.value = true; // Start loading indicator
                    teacherdropdowncontroller.changeHod().then((_) {
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
                      : const Text('Change HOD', style: TextStyle(fontSize: 16)),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
