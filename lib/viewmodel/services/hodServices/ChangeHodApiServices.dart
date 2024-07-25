import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HodService {
  static Future<String> fetchCurrentHod(int departmentId) async {
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();
    final response = await ApiHelper.get(
      'teacher/currentHOD?deptId=$departmentId', // Replace with your API endpoint
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data); // Debugging line, can be removed in production
      if (data.containsKey('name')) {
        return data['name'];
      } else {
        throw Exception('Name not found in response');
      }
    } else {
      throw Exception('Failed to load current HOD');
    }
  }
}
