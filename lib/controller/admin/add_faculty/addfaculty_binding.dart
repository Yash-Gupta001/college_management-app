import 'package:flutter_flavors/controller/admin/add_faculty/addfaculty_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class AddfacultyBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize FacultyDao first
    Get.lazyPut<FacultyDao>(() => Get.find<AppDatabase>().facultyDao);
    // Then initialize AddFacultyController which depends on FacultyDao
    Get.lazyPut<AddFacultyController>(() => AddFacultyController());
  }
}