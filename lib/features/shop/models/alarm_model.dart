// alarm_model.dart
class AlarmModel {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;

  AlarmModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  // Create AlarmModel from Map (for deserialization)
  factory AlarmModel.fromMap(Map<String, dynamic> map) {
    return AlarmModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: DateTime.parse(map['dateTime'] as String),
    );
  }

  // Convert AlarmModel to Map (for serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
