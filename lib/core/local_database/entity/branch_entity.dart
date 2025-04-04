import 'package:floor/floor.dart';

@Entity(tableName: 'branch_entity')
class BranchEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  BranchEntity({ this.id, required this.name});
}
