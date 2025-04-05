import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/examtimetable_entity.dart';

@dao
abstract class Examtimetabledao {
  @Query('SELECT * FROM examtimetable_entity ORDER BY date ASC')
  Future<List<ExamtimetableEntity>> getAllExamtimetables();

  @Query('SELECT * FROM examtimetable_entity WHERE date BETWEEN :start AND :end ORDER BY date ASC')
  Future<List<ExamtimetableEntity>> getExamtimetablesInRange(DateTime start, DateTime end);

  @Query('SELECT * FROM examtimetable_entity WHERE type = :type ORDER BY date ASC')
  Future<List<ExamtimetableEntity>> getExamtimetablesByType(String type);

  @insert
  Future<void> insertExamtimetable(ExamtimetableEntity examtimetable);

  @update
  Future<void> updateExamtimetable(ExamtimetableEntity examtimetable);

  @delete
  Future<void> deleteExamtimetable(ExamtimetableEntity examtimetable);
}