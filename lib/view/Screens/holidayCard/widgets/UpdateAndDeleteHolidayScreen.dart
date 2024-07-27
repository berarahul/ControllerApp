import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/HolidayCard/UpdateHolidayModel.dart';
import '../../../../viewmodel/services/holidayServices/update/HolidayUpdateAndDeleteController.dart';

class HolidayListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HolidayController holidayController = Get.put(HolidayController());

    return Scaffold(
      appBar: AppBar(title: const Text('Holidays')),
      body: Obx(() {
        if (holidayController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: holidayController.holidays.length,
            itemBuilder: (context, index) {
              final holiday = holidayController.holidays[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  title: Text(
                    holiday.reason,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    '${holiday.startDate.toLocal().toString().split(' ')[0]} - ${holiday.endDate.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (String result) {
                      if (result == 'Edit') {
                        _showEditDialog(context, holiday, holidayController);
                      } else if (result == 'Delete') {
                        holidayController.deleteHoliday(holiday.id!);
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  void _showEditDialog(BuildContext context, HolidayModel holiday, HolidayController holidayController) {
    TextEditingController reasonController = TextEditingController(text: holiday.reason);
    TextEditingController startDateController = TextEditingController(text: holiday.startDate.toLocal().toString().split(' ')[0]);
    TextEditingController endDateController = TextEditingController(text: holiday.endDate.toLocal().toString().split(' ')[0]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Holiday'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: holiday.startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null && selectedDate != holiday.startDate) {
                    startDateController.text = selectedDate.toLocal().toString().split(' ')[0];
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: startDateController,
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: holiday.endDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null && selectedDate != holiday.endDate) {
                    endDateController.text = selectedDate.toLocal().toString().split(' ')[0];
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: endDateController,
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                holidayController.updateHoliday(
                  holiday.id.toString(),
                  reasonController.text,
                  DateTime.parse(startDateController.text),
                  DateTime.parse(endDateController.text),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
