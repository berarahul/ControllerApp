// all_teacher_model.dart
class AllTeacherModel {
  final int teacherId;
  final String name;

  AllTeacherModel({required this.teacherId, required this.name});

  factory AllTeacherModel.fromJson(Map<String, dynamic> json) {
    return AllTeacherModel(
      teacherId: json['teacherId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teacherId': teacherId,
      'name': name,
    };
  }
}
