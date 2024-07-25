import 'dart:convert';
import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:get/get.dart';
import '../../../../model/HolidayCard/CreateHolidayModel.dart';
import 'package:http/http.dart' as http;

class Holidayaddcontroller extends GetxController {
  var post = PostModel(
    reason: '',
    startDate: DateTime.now(),
    endDate: DateTime.now(),
  ).obs;

  // Getters for the properties
  String get reason => post.value.reason;
  DateTime get startDate => post.value.startDate;
  DateTime get endDate => post.value.endDate;

  // Setters for the properties
  void updateReason(String newReason) {
    post.update((post) {
      post?.reason = newReason;
    });
  }

  void updateStartDate(DateTime newStartDate) {
    post.update((post) {
      post?.startDate = newStartDate;
    });
  }

  void updateEndDate(DateTime newEndDate) {
    post.update((post) {
      post?.endDate = newEndDate;
    });
  }

  // Method to update the entire post
  void updatePost(PostModel newPost) {
    post.value = newPost;
  }

  Future<void> sendHolidayData() async {
    final url = Uri.parse('https://attendancesystem-s1.onrender.com/api/holiday/createHoliday');
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();
    final body = json.encode(post.value.toJson());
    print(body);
    print(headers);

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        // Handle successful response
        print('Holiday added successfully');
        Get.snackbar("Success", "Holiday added successfully");
      } else {
        // Handle error response
        print('Failed to add holiday: ${response.statusCode}');
        Get.snackbar("OOps", "Holiday did not Added");      }
    } catch (e) {
      // Handle exceptions
      print('Error sending holiday data: $e');
      Get.snackbar("error", "$e");
    }
  }
}
