class PostModel {

  String reason;
  DateTime startDate;
  DateTime endDate;

  PostModel({

    required this.reason,
    required this.startDate,
    required this.endDate,
  });

  // Create a PostModel instance from a JSON map
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(

      reason: json['reason'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }

  // Convert a PostModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {

      'reason': reason,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
