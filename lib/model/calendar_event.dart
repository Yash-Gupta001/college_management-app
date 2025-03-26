import 'dart:ui';

class CalendarEvent {
  final String id;
  final String title;
  final DateTime date;
  final EventType type;
  final String? description;
  final Color color;

  CalendarEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
    this.description,
    required this.color,
  });

  factory CalendarEvent.fromMap(Map<String, dynamic> map) {
    return CalendarEvent(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      type: EventType.values.firstWhere((e) => e.toString() == 'EventType.${map['type']}'),
      description: map['description'],
      color: Color(map['color']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'type': type.toString().split('.').last,
      'description': description,
      'color': color.value,
    };
  }
}

enum EventType { holiday, exam, general }