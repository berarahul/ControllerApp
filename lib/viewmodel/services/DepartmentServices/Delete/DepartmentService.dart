import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../model/DepartmentCard/allDepartmentModel.dart';
 // Update the import as needed
ApiHelper apiHelper =ApiHelper();
class DepartmentService {
  static Future<List<AllDepartmentModel>> fetchDepartments() async {
    final response = await http.get(
      Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/all'), // Replace with your API endpoint
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => AllDepartmentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }

  static Future<void> deleteDepartment(int deptId) async {
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();
    final response = await ApiHelper.delete(

      'controller/deleteDepartment?deptId=$deptId', // Replace with your API endpoint
      headers: headers,

    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete department');
    }
  }
}
