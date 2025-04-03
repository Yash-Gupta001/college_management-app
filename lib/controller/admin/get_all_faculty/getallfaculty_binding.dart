import 'package:flutter_flavors/controller/admin/get_all_faculty/getallfaculty_controller.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class GetAllFacultyBinding extends Bindings {
  @override
  void dependencies() {
    // Get the database instance (should be already initialized in main.dart)
    final database = Get.find<AppDatabase>();
    
    // Register FacultyDao first
    Get.lazyPut<FacultyDao>(() => database.facultyDao);
    Get.lazyPut<BranchDao>(() => database.branchdao);
    // Then register controller with the dao dependency
    Get.lazyPut<GetallFacultyController>(
      () => GetallFacultyController(Get.find<FacultyDao>(), Get.find<BranchDao>()),
    );

    // Lazy load AdminScreenController and pass SubjectDao as a dependency
    Get.lazyPut<GetAllSubjectsController>(() => GetAllSubjectsController(database.subjectDao,database.branchdao));
  }
}