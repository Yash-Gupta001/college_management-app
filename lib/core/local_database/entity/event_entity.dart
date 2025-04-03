import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/type_convertors/date_time_converter.dart';

@Entity(tableName: 'event_entity')
class EventEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  
  @TypeConverters([DateTimeConverter])
  final DateTime date;
  
  final String type; // 'holiday' or 'exam'
  final String? description;

  EventEntity({
    this.id,
    required this.title,
    required this.date,
    required this.type,
    this.description,
  });

  // Add copyWith method for easier updates
  EventEntity copyWith({
    int? id,
    String? title,
    DateTime? date,
    String? type,
    String? description,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      type: type ?? this.type,
      description: description ?? this.description,
    );
  }
}