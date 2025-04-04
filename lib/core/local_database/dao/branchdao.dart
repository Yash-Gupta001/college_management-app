import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';

@dao
abstract class BranchDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertBranch(BranchEntity branch);

  @Query('SELECT * FROM branch_entity')
  Future<List<BranchEntity>> getAllBranches();

  @Query('SELECT * FROM branch_entity WHERE id = :branchId')
  Future<BranchEntity?> getBranchById(int branchId);

  @Query('''
    SELECT b.name 
    FROM branch_entity b 
    INNER JOIN subject_entity s ON b.id = s.branchId
    WHERE s.name = :subjectName
  ''')
  Future<String?> getBranchNameBySubject(String subjectName);
}
