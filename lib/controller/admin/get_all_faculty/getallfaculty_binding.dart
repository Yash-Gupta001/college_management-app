import 'package:flutter_flavors/controller/admin/get_all_faculty/getallfaculty_controller.dart';
import 'package:flutter_flavors/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/local_database/database/app_database.dart';
import 'package:get/get.dart';

class GetAllFacultyBinding extends Bindings {
  @override
  void dependencies() {
    // Get the database instance (should be already initialized in main.dart)
    final database = Get.find<AppDatabase>();
    
    // Register FacultyDao first
    Get.lazyPut<FacultyDao>(() => database.facultyDao);
    
    // Then register controller with the dao dependency
    Get.lazyPut<GetallFacultyController>(
      () => GetallFacultyController(Get.find<FacultyDao>()),
    );
  }
}