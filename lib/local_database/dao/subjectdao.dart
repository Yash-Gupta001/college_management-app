import 'package:floor/floor.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';

@dao
abstract class SubjectDao {
  @insert
  Future<void> insertSubject(SubjectEntity subject);

  @delete
  Future<void> deleteSubject(SubjectEntity subject);

  @Query('SELECT * FROM subject_entity')
  Future<List<SubjectEntity>> getAllSubjects();

  @Query('SELECT * FROM subject_entity WHERE id = :id')
  Future<SubjectEntity?> getSubjectById(int id);
}
