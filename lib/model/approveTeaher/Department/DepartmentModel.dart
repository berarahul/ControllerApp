class Department {
  int? id;
  String? departmentName;

  Department({this.id, this.departmentName});

  // Factory method to create a Department instance from JSON
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] as int?,
      departmentName: json['departmentName'] as String?,
    );
  }

  // Method to convert Department instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departmentName': departmentName,
    };
  }
}
