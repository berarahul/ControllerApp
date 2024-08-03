
import 'package:controller/model/DepartmentCard/allDepartmentModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../model/DepartmentCard/allTeacherModel.dart';
import '../../LoginService/AutharizationHeader.dart';

class ApiServiceForPrimaryDept {
  static Future<List<AllDepartmentModel>?> fetchDepartments() async {
    var response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/all'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse as List).map((data) => AllDepartmentModel.fromJson(data)).toList();
    }
    return null;
  }

  static Future<List<AllTeacherModel>> fetchTeachers(int deptid) async {
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();
    final response = await http.get(
      Uri.parse(
          'https://attendancesystem-s1.onrender.com/api/controller/teachers?primaryDept=$deptid'), // Replace with your API endpoint
      headers: headers,
    );

    if (response.statusCode == 200) {
      print("HI success");
      final List<dynamic> jsonList = jsonDecode(response.body);
      print(jsonList);
      return jsonList.map((json) => AllTeacherModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Teachers');
    }
  }

  static Future<List<AllDepartmentModel>?> fetchSecondDepartments(int teacherId) async {
    var response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/all'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse as List).map((data) => AllDepartmentModel.fromJson(data)).toList();
    }
    return null;
  }
}
