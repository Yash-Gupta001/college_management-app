import 'package:floor/floor.dart';

import '../entity/student_entity.dart';

@dao
abstract class StudentDao {

  // Find all students
  @Query('SELECT * FROM student_entity')
  Future<List<StudentEntity>> findAllStudents();

  // Insert a student
  @insert
  Future<void> insertStudent(StudentEntity student);

  // Update a student
  @update
  Future<void> updateStudent(StudentEntity student);

  // Delete a student
  @delete
  Future<void> deleteStudent(StudentEntity student);

  // Find a student by their username and password
  @Query('SELECT * FROM student_entity WHERE username = :username AND password = :password')
  Future<StudentEntity?> findStudentByUsernameAndPassword(String username, String password);

  // Find a student by username
  @Query('SELECT * FROM student_entity WHERE username = :username')
  Future<StudentEntity?> findStudentByUsername(String username);

  // Delete all students
  @Query('DELETE FROM student_entity')
  Future<void> deleteAllStudents();
}
