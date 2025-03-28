import 'package:floor/floor.dart';
import '../entity/faculty_entity.dart';

@dao
abstract class FacultyDao {
  
  @Query('SELECT * FROM faculty_entity')
  Future<List<FacultyEntity>> findAllFaculties();

  @insert
  Future<void> insertFaculty(FacultyEntity faculty);

  @update
  Future<void> updateFaculty(FacultyEntity faculty);

  @delete
  Future<void> deleteFaculty(FacultyEntity faculty);

  @Query('SELECT * FROM faculty_entity WHERE username = :username AND password = :password')
  Future<FacultyEntity?> findFacultyByUsernameAndPassword(String username, String password);

  @Query('SELECT * FROM faculty_entity WHERE username = :username')
  Future<FacultyEntity?> findFacultyByUsername(String username);
}
