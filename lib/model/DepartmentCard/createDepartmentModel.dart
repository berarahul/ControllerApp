class Createdepartmentmodel {
  final int deptId;
  final String departmentName;

  Createdepartmentmodel({required this.deptId, required this.departmentName});

  factory Createdepartmentmodel.fromJson(Map<String, dynamic> json) {
    return Createdepartmentmodel(
      deptId: json['deptId'],
      departmentName: json['departmentName'],
    );
  }
}
