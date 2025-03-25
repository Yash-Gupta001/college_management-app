import 'package:floor/floor.dart';
import '../entity/admin_entity.dart';

@dao
abstract class AdminDao {

  // Find all admins
  @Query('SELECT * FROM admin_entity')
  Future<List<AdminEntity>> findAllAdmins();

  // Insert an admin
  @insert
  Future<void> insertAdmin(AdminEntity admin);

  // Update an admin
  @update
  Future<void> updateAdmin(AdminEntity admin);

  // Delete an admin
  @delete
  Future<void> deleteAdmin(AdminEntity admin);

  // Find admin by username and password
  @Query('SELECT * FROM admin_entity WHERE username = :username AND password = :password')
  Future<AdminEntity?> findAdminByUsernameAndPassword(String username, String password);

  // Find admin by username
  @Query('SELECT * FROM admin_entity WHERE username = :username')
  Future<AdminEntity?> findAdminByUsername(String username);
}
