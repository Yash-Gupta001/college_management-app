import 'package:floor/floor.dart';
import 'package:flutter_flavors/local_database/entity/student_entity.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';

@Entity(
  tableName: 'student_subject_entity',
  foreignKeys: [
    ForeignKey(
      childColumns: ['studentRollNo'],
      parentColumns: ['rollNo'],
      entity: StudentEntity,
    ),
    ForeignKey(
      childColumns: ['subjectId'],
      parentColumns: ['id'],
      entity: SubjectEntity,
    ),
  ],
)
class StudentSubjectEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final int studentRollNo;
  final int subjectId;

  StudentSubjectEntity({
    this.id,
    required this.studentRollNo,
    required this.subjectId,
  });
}
