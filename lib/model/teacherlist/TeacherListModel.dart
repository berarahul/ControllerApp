class Teacher {
  final int id;
  final String name;
  final String idCardNumber;

  Teacher({
    required this.id,
    required this.name,
    required this.idCardNumber,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json['id'] as int,
    name: json['name'] as String,
    idCardNumber: json['idCardNumber'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'idCardNumber': idCardNumber,
  };
}
