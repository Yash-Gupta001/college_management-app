import 'package:floor/floor.dart';

@Entity(tableName: 'admin_entity')
class AdminEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String username;
  final String password;
  final String name;
  final String role;
  final String email;
  
  AdminEntity({
    this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.role,
    required this.email,
  });
}
