import 'package:floor/floor.dart';

@Entity(tableName: 'subject_entity')
class SubjectEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  SubjectEntity({
    this.id,
    required this.name,
  });
}
