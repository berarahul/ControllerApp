class HolidayModel {
  final int? id;
  final String reason;
  final DateTime startDate;
  final DateTime endDate;

  HolidayModel({
    required this.id,
    required this.reason,
    required this.startDate,
    required this.endDate,
  });

  factory HolidayModel.fromJson(Map<String, dynamic> json) {
    return HolidayModel(
      id: json['id'],
      reason: json['reason'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
