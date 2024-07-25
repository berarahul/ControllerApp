// // teacher_service.dart
// import 'package:controller/viewmodel/services/hodServices/HodDropdownController.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../../../model/DepartmentCard/allTeacherModel.dart';
//
//
//
// class TeacherService {
//
//   final String apiUrl = 'https://attendancesystem-s1.onrender.com/api/hod/teacher/allTeachers?deptId=$deptID'; // Replace with your API URL
//
//   Future<List<AllTeacherModel>?> getTeachers() async {
//
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//
//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         return jsonResponse.map((data) => AllTeacherModel.fromJson(data)).toList();
//       } else {
//         // Handle server errors
//         print('Failed to load teachers');
//         return null;
//       }
//     } catch (e) {
//       // Handle network errors
//       print('Error: $e');
//       return null;
//     }
//   }
// }



// teacher_service.dart
import 'package:controller/model/DepartmentCard/allDepartmentModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../model/DepartmentCard/allTeacherModel.dart';

class TeacherService {
  Future<List<AllTeacherModel>?> getTeachers(AllDepartmentModel deptID) async {
    final String apiUrl = 'https://attendancesystem-s1.onrender.com/api/hod/teacher/allTeachers?deptId=$deptID';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => AllTeacherModel.fromJson(data)).toList();
      } else {
        print('Failed to load teachers');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
