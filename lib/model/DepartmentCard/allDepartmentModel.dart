class AllDepartmentModel {
  final int id;
  final String departmentName;

  AllDepartmentModel({required this.id, required this.departmentName});

  factory AllDepartmentModel.fromJson(Map<String, dynamic> json) {
    return AllDepartmentModel(
      id: json['id'],
      departmentName: json['departmentName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departmentName': departmentName,
    };
  }
}
