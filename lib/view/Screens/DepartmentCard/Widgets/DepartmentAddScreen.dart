// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../viewmodel/services/DepartmentServices/add/CreateDepartmentController.dart';
// // Update the import as needed
//
// class AddDepartmentScreen extends StatelessWidget {
//   final CreateDepartmentController departmentController = Get.put(CreateDepartmentController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _textEditingController = TextEditingController();
//   final RxBool isLoading = false.obs;
//   @override
//   Widget build(BuildContext context) {
//     // Listen to departmentName changes and update the TextEditingController
//     ever(departmentController.departmentName, (value) {
//       _textEditingController.value = _textEditingController.value.copyWith(
//         text: value,
//         selection: TextSelection.fromPosition(
//           TextPosition(offset: value.length),
//         ),
//       );
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Add Department'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: 'Department Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   onChanged: departmentController.setDepartmentName,
//                   controller: _textEditingController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a department name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 120),
//                 Obx(() => departmentController.isLoading.value
//                     ? const CircularProgressIndicator()
//                     : ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       departmentController.addDepartment();
//                     }
//                   },
//
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white, backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                     minimumSize: Size(100, 60),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: isLoading.value
//                       ? const SizedBox(
//                     width: 24,
//                     height: 24,
//                     child: CircularProgressIndicator(
//                       color: Colors.black,
//                       strokeWidth: 2,
//                     ),
//                   )
//                       : const Text('Add Department', style: TextStyle(fontSize: 16)),
//                 ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../viewmodel/services/DepartmentServices/add/CreateDepartmentController.dart';

class AddDepartmentScreen extends StatelessWidget {
  final CreateDepartmentController departmentController = Get.put(CreateDepartmentController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    // Listen to departmentName changes and update the TextEditingController
    ever(departmentController.departmentName, (value) {
      _textEditingController.value = _textEditingController.value.copyWith(
        text: value,
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add Department'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Department Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: departmentController.setDepartmentName,
                    controller: _textEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a department name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 120),
                  Obx(() => departmentController.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        departmentController.addDepartment();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      minimumSize: const Size(100, 60),
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
                        : const Text('Add Department', style: TextStyle(fontSize: 16)),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
