import 'package:floor/floor.dart';

@Entity(tableName: 'examtimetable_entity')
class ExamtimetableEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final String date; // e.g. "2025-04-10"
  final String type; // 'holiday' or 'exam'
  final String? description;
  final String? subjectName; // Only relevant if type == 'exam'
  final int? branchId; // Nullable to support holidays that apply to all branches

  ExamtimetableEntity({
    this.id,
    required this.title,
    required this.date,
    required this.type,
    this.description,
    this.subjectName,
    this.branchId,
  });
}
