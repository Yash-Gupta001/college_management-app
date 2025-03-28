import 'package:floor/floor.dart';

@Entity(tableName: 'faculty_entity')
class FacultyEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;
  final String lastname;
  final String username;
  final String password;
  final String email;
  final double salary;
  final String contactNo;


  FacultyEntity({
    this.id,
    required this.lastname, 
    required this.salary, 
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    required this.contactNo, 
  });
}
