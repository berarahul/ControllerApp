class TeacherModel {
  final int teacherId;
  final String name;

  TeacherModel({
    required this.teacherId,
    required this.name,
  });

  // Factory method to create a TeacherModel from a JSON map
  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      teacherId: json['teacherId'],
      name: json['name'],
    );
  }

  // Method to convert TeacherModel to JSON map
  Map<String, dynamic> toJson() {
    return {
      'teacherId': teacherId,
      'name': name,
    };
  }
}
