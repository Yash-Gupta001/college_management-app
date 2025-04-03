import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';

@Entity(
  tableName: 'subject_entity',
  foreignKeys: [
    ForeignKey(
      childColumns: ['branchId'],
      parentColumns: ['id'],
      entity: BranchEntity,
    ),
  ],
)
class SubjectEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final int branchId;

  SubjectEntity({this.id, required this.name, required this.branchId});
}
