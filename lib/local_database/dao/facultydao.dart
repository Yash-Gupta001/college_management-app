import 'package:floor/floor.dart';
import '../entity/faculty_entity.dart';

@dao
abstract class FacultyDao {

  // Find all faculties
  @Query('SELECT * FROM faculty_entity')
  Future<List<FacultyEntity>> findAllFaculties();

  // Insert a faculty
  @insert
  Future<void> insertFaculty(FacultyEntity faculty);

  // Update a faculty
  @update
  Future<void> updateFaculty(FacultyEntity faculty);

  // Delete a faculty
  @delete
  Future<void> deleteFaculty(FacultyEntity faculty);

  // Find faculty by username and password
  @Query('SELECT * FROM faculty_entity WHERE username = :username AND password = :password')
  Future<FacultyEntity?> findFacultyByUsernameAndPassword(String username, String password);

  // Find faculty by username
  @Query('SELECT * FROM faculty_entity WHERE username = :username')
  Future<FacultyEntity?> findFacultyByUsername(String username);
}
