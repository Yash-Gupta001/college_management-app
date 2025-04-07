import 'package:flutter_flavors/ui/controller/admin/add_faculty/addfaculty_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:flutter_flavors/ui/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:get/get.dart';


class AddfacultyBinding extends Bindings {
  @override
  void dependencies() {
    // Access the database instance and provide the SubjectDao
    final database = Get.find<AppDatabase>();

    // Initialize FacultyDao first
    Get.lazyPut<FacultyDao>(() => Get.find<AppDatabase>().facultyDao);

    // Then initialize AddFacultyController which depends on FacultyDao
    Get.lazyPut<AddFacultyController>(() => AddFacultyController());
   

    // Lazy load AdminScreenController and pass SubjectDao as a dependency
    Get.lazyPut<GetAllSubjectsController>(() => GetAllSubjectsController(database.subjectDao,database.branchdao));
  }
}