import 'package:floor/floor.dart';

@Entity(tableName: 'calendarevents_entity')
class CalendarEventEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final DateTime date;
  final String type;
  final String? description;
  final int color;

  CalendarEventEntity({
    this.id,
    required this.title,
    required this.date,
    required this.type,
    this.description,
    required this.color,
  });
}