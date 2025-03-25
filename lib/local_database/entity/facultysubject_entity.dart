import 'package:floor/floor.dart';
import 'package:flutter_flavors/local_database/entity/faculty_entity.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';

@Entity(
  tableName: 'faculty_subject_entity',
  foreignKeys: [
    ForeignKey(
      childColumns: ['facultyId'],
      parentColumns: ['id'],
      entity: FacultyEntity,
    ),
    ForeignKey(
      childColumns: ['subjectId'],
      parentColumns: ['id'],
      entity: SubjectEntity,
    ),
  ],
)
class FacultySubjectEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final int facultyId;
  final int subjectId;

  FacultySubjectEntity({
    this.id,
    required this.facultyId,
    required this.subjectId,
  });
}
