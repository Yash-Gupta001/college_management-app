import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/studentsubject_entity.dart';

@dao
abstract class StudentSubjectDao {
  @insert
  Future<void> insertStudentSubject(StudentSubjectEntity studentSubject);

  @Query('SELECT * FROM student_subject_entity WHERE studentRollNo = :studentRollNo')
  Future<List<StudentSubjectEntity>> getSubjectsForStudent(int studentRollNo);

  @Query('SELECT * FROM student_subject_entity WHERE subjectId = :subjectId')
  Future<List<StudentSubjectEntity>> getStudentsForSubject(int subjectId);
}
