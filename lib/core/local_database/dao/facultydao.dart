import 'package:floor/floor.dart';
import '../entity/faculty_entity.dart';

@dao
abstract class FacultyDao {
  
  // to get all the faculties
  @Query('SELECT * FROM faculty_entity')
  Future<List<FacultyEntity>> findAllFaculties();

  // to insert faculty
  @insert
  Future<void> insertFaculty(FacultyEntity faculty);

  // to update faculty
  @update
  Future<void> updateFaculty(FacultyEntity faculty);

  // to delete faculty
  @delete
  Future<void> deleteFaculty(FacultyEntity faculty);

  // to authenticate faculty
  @Query('SELECT * FROM faculty_entity WHERE username = :username AND password = :password')
  Future<FacultyEntity?> findFacultyByUsernameAndPassword(String username, String password);

  // find faculty by username
  @Query('SELECT * FROM faculty_entity WHERE username = :username')
  Future<FacultyEntity?> findFacultyByUsername(String username);
}
