import 'package:floor/floor.dart';

@Entity(tableName: 'student_entity')
class StudentEntity {
  @PrimaryKey(autoGenerate: true)
  int? rollNo;

  final String username;
  final String password;
  final String name;
  final String email;

  StudentEntity({
    this.rollNo,
    required this.username,
    required this.password,
    required this.name,
    required this.email,
  });
}
