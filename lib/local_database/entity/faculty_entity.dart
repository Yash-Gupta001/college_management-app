import 'package:floor/floor.dart';

@Entity(tableName: 'faculty_entity')
class FacultyEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String username;
  final String password;
  final String name;
  final String department;
  final String email;

  FacultyEntity({
    this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.department,
    required this.email,
  });
}
