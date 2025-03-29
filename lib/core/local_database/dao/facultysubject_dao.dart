import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/faculty_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/facultysubject_entity.dart';


@dao
abstract class FacultySubjectDao {
  @insert
  Future<void> insertFacultySubject(FacultySubjectEntity facultySubject);

  @Query('SELECT * FROM faculty_subject_entity WHERE subjectId = :subjectId')
  Future<List<FacultySubjectEntity>> getFacultiesForSubject(int subjectId);

  @Query('SELECT * FROM faculty_entity f INNER JOIN faculty_subject_entity fs ON f.id = fs.facultyId WHERE fs.subjectId = :subjectId')
  Future<List<FacultyEntity>> getFacultyForSubject(int subjectId);
}
