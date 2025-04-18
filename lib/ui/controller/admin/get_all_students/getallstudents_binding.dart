import 'package:flutter_flavors/ui/controller/admin/get_all_students/getallstudents_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class GetAllStudentsBinding extends Bindings {
  @override
  void dependencies() {
    // Access the database instance and provide the SubjectDao
    final database = Get.find<AppDatabase>();

    // Register FacultyDao first
    Get.lazyPut<StudentDao>(() => database.studentDao);

    // Lazy load GetallStudentsController and pass studentDao as a dependency
    Get.lazyPut<GetallStudentsController>(() => GetallStudentsController(database.studentDao,database.branchdao,database.subjectDao));


  
  }
}
