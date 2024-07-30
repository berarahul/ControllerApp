import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../model/HolidayCard/UpdateHolidayModel.dart';

class HolidayController extends GetxController {
  var holidays = <HolidayModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchHolidays();
    super.onInit();
  }

  void fetchHolidays() async {
    isLoading.value = true;
    final url = Uri.parse(
        'https://attendancesystem-s1.onrender.com/api/holiday/allHolidays');

    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        holidays.value =
            data.map((json) => HolidayModel.fromJson(json)).toList();
      } else {
        // Handle error
        print('Failed to load holidays');
      }
    } catch (e) {
      // Handle exception
      print('Error fetching holidays: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void deleteHoliday(int id) async {
    final url = Uri.parse(
        'https://attendancesystem-s1.onrender.com/api/holiday/deleteHoliday?id=$id');

    // Define the headers
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();

    try {
      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        holidays.removeWhere((holiday) => holiday.id == id);
      } else {
        // Handle error
        print('Failed to delete holiday');
      }
    } catch (e) {
      // Handle exception
      print('Error deleting holiday: $e');
    }
  }

  void updateHoliday(
      String id, String reason, DateTime startDate, DateTime endDate) async {
    final url = Uri.parse(
        'https://attendancesystem-s1.onrender.com/api/holiday/editHoliday');
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();
    final body = json.encode({
      'id': id,
      'reason': reason,
      'startDate': startDate.toIso8601String().split('T')[0],
      'endDate': endDate.toIso8601String().split('T')[0],
    });

    try {
      final response = await http.put(url, headers: headers, body: body);
      print(body);
      if (response.statusCode == 200) {
        // Handle successful update
        Get.snackbar("Success", "Holiday Updated Successfully");
        fetchHolidays();
      } else {
        // Handle error response
        print('Failed to update holiday: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating holiday: $e');
    }
  }
}
