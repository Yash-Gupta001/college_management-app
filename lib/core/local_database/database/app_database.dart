import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/dao/eventdao.dart';
import 'package:flutter_flavors/core/local_database/dao/facultysubject_dao.dart';
import 'package:flutter_flavors/core/local_database/dao/studentsubject_dao.dart';
import 'package:flutter_flavors/core/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/core/local_database/entity/admin_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/event_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/faculty_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/facultysubject_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/studentsubject_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';
import 'package:flutter_flavors/core/local_database/type_convertors/date_time_converter.dart';
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
    FacultySubjectEntity,
    EventEntity,
    BranchEntity
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
  EventDao get eventDao;
  BranchDao get branchdao;
}

 
// flutter packages pub run build_runner build