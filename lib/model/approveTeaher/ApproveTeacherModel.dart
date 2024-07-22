class ApproveTeacherModel {
  int teacherId;
  List<int> addDept;

  ApproveTeacherModel({
    required this.teacherId,
    required this.addDept,
  });

  // Factory constructor to create an instance from a JSON map
  factory ApproveTeacherModel.fromJson(Map<String, dynamic> json) {
    return ApproveTeacherModel(
      teacherId: json['teacherId'],
      addDept: List<int>.from(json['addDept']),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'teacherId': teacherId,
      'addDept': addDept,
    };
  }
}
