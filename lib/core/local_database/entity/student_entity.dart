import 'package:floor/floor.dart';

@Entity(tableName: 'student_entity')
class StudentEntity {
  @PrimaryKey(autoGenerate: true)
  int? rollNo;

  final String username;
  final String password;
  final String name;
  final String email;
  final String contactNo;
  final int fees;

  StudentEntity({
    this.rollNo,
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    required this.contactNo,
    this.fees = 25000, 
  });
}
