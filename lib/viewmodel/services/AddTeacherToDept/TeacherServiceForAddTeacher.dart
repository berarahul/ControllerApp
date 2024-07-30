import 'package:controller/model/DepartmentCard/allTeacherModel.dart';
import 'package:controller/viewmodel/services/LoginService/AutharizationHeader.dart';
import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../model/DepartmentCard/allDepartmentModel.dart';

// Update the import as needed
ApiHelper apiHelper = ApiHelper();

class TeacherServiceforAddTeacher {
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

  static Future<void> ChangeHOD(int teacherID,int deptID) async {
    print("Hi update");
    ApiHelper apiHelper = ApiHelper(); // Create an instance of ApiHelper
    final headers = await apiHelper.getHeaders();
    final response = await ApiHelper.update(
      'controller/changeHOD?deptId=$deptID&newHodId=$teacherID', // Replace with your API endpoint
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to Change HOD');
    }
  }
}
