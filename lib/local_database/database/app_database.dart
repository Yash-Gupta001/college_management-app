import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_flavors/local_database/dao/facultysubject_dao.dart';
import 'package:flutter_flavors/local_database/dao/studentsubject_dao.dart';
import 'package:flutter_flavors/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/local_database/entity/admin_entity.dart';
import 'package:flutter_flavors/local_database/entity/faculty_entity.dart';
import 'package:flutter_flavors/local_database/entity/facultysubject_entity.dart';
import 'package:flutter_flavors/local_database/entity/student_entity.dart';
import 'package:flutter_flavors/local_database/entity/studentsubject_entity.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/studentdao.dart';
import '../dao/facultydao.dart';
import '../dao/admindao.dart';


part 'app_database.g.dart';

@Database(
  entities: [
    AdminEntity,
    StudentEntity,
    FacultyEntity,
    SubjectEntity,
    StudentSubjectEntity,
    FacultySubjectEntity
  ],
  version: 1,
)
abstract class AppDatabase extends FloorDatabase {
  StudentDao get studentDao;
  FacultyDao get facultyDao;
  SubjectDao get subjectDao;
  StudentSubjectDao get studentSubjectDao;
  FacultySubjectDao get facultySubjectDao;
  AdminDao get admindao;
}

 
// flutter packages pub run build_runner build