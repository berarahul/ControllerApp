// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:controller/viewmodel/services/holidayServices/add/HolidayAddController.dart';
//
// class Createholidayscreen extends StatelessWidget {
//   final TextEditingController reasonController = TextEditingController();
//   final TextEditingController startDateController = TextEditingController();
//   final TextEditingController endDateController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final Holidayaddcontroller holidayaddcontroller = Get.put(Holidayaddcontroller());
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Holiday')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() {
//           // Ensure that the controller texts are set only once
//           if (reasonController.text != holidayaddcontroller.reason) {
//             reasonController.text = holidayaddcontroller.reason;
//           }
//           if (startDateController.text != holidayaddcontroller.startDate.toLocal().toString().split(' ')[0]) {
//             startDateController.text = holidayaddcontroller.startDate.toLocal().toString().split(' ')[0];
//           }
//           if (endDateController.text != holidayaddcontroller.endDate.toLocal().toString().split(' ')[0]) {
//             endDateController.text = holidayaddcontroller.endDate.toLocal().toString().split(' ')[0];
//           }
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: reasonController,
//                 textAlign: TextAlign.start,
//                 textDirection: TextDirection.ltr,
//                 decoration: const InputDecoration(labelText: 'Reason'),
//                 onChanged: (value) => holidayaddcontroller.updateReason(value),
//               ),
//               const SizedBox(height: 16.0),
//               GestureDetector(
//                 onTap: () async {
//                   DateTime? selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: holidayaddcontroller.startDate,
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2100),
//                   );
//
//                   if (selectedDate != null && selectedDate != holidayaddcontroller.startDate) {
//                     holidayaddcontroller.updateStartDate(selectedDate);
//                   }
//                 },
//                 child: AbsorbPointer(
//                   child: TextField(
//                     controller: startDateController,
//                     decoration: const InputDecoration(
//                       labelText: 'Start Date',
//                       suffixIcon: Icon(Icons.calendar_today),
//                     ),
//                     textAlign: TextAlign.start,
//                     textDirection: TextDirection.ltr,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               GestureDetector(
//                 onTap: () async {
//                   DateTime? selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: holidayaddcontroller.endDate,
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2100),
//                   );
//
//                   if (selectedDate != null && selectedDate != holidayaddcontroller.endDate) {
//                     holidayaddcontroller.updateEndDate(selectedDate);
//                   }
//                 },
//                 child: AbsorbPointer(
//                   child: TextField(
//                     controller: endDateController,
//                     decoration: const InputDecoration(
//                       labelText: 'End Date',
//                       suffixIcon: Icon(Icons.calendar_today),
//                     ),
//                     textAlign: TextAlign.start,
//                     textDirection: TextDirection.ltr,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Save or process the updated post as needed
//                     holidayaddcontroller.sendHolidayData();
//
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: const Text(
//                     'Add Holiday',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//
//
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:controller/viewmodel/services/holidayServices/add/HolidayAddController.dart';

class Createholidayscreen extends StatelessWidget {
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Holidayaddcontroller holidayaddcontroller = Get.put(Holidayaddcontroller());

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add Holiday')

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          // Ensure that the controller texts are set only once
          if (reasonController.text != holidayaddcontroller.reason) {
            reasonController.text = holidayaddcontroller.reason;
          }
          if (startDateController.text != holidayaddcontroller.startDate.toLocal().toString().split(' ')[0]) {
            startDateController.text = holidayaddcontroller.startDate.toLocal().toString().split(' ')[0];
          }
          if (endDateController.text != holidayaddcontroller.endDate.toLocal().toString().split(' ')[0]) {
            endDateController.text = holidayaddcontroller.endDate.toLocal().toString().split(' ')[0];
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: reasonController,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                decoration: const InputDecoration(labelText: 'Reason'),
                onChanged: (value) => holidayaddcontroller.updateReason(value),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: holidayaddcontroller.startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null && selectedDate != holidayaddcontroller.startDate) {
                    holidayaddcontroller.updateStartDate(selectedDate);
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: startDateController,
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: holidayaddcontroller.endDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null && selectedDate != holidayaddcontroller.endDate) {
                    holidayaddcontroller.updateEndDate(selectedDate);
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: endDateController,
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateFields()) {
                      // Save or process the updated post as needed
                      holidayaddcontroller.sendHolidayData();
                      Get.snackbar("Success", "Holiday Added Successfully");
                    } else {
                      Get.snackbar("Error", "Please fill all the fields");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Add Holiday',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  bool _validateFields() {
    if (reasonController.text.isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.isEmpty) {
      return false;
    }
    return true;
  }
}


