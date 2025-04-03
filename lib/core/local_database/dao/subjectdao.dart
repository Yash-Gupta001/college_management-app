import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';

@dao
abstract class SubjectDao {

  // insert a subject into database
  @insert
  Future<void> insertSubject(SubjectEntity subject);

  // delect a subject from database
  @delete
  Future<void> deleteSubject(SubjectEntity subject);

  // update name of a subject
  @update
  Future<void> updateSubject(SubjectEntity subject);

  // get all subjects
  @Query('SELECT * FROM subject_entity')
  Future<List<SubjectEntity>> getAllSubjects();

  // get a subject by their id
  @Query('SELECT * FROM subject_entity WHERE id = :id')
  Future<SubjectEntity?> getSubjectById(int id);

  // to get subjects from branch where it belongs to
  @Query('SELECT * FROM subject_entity WHERE branchId = :branchId')
  Future<List<SubjectEntity>> getSubjectsByBranch(int branchId);

}
