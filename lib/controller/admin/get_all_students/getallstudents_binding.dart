import 'package:flutter_flavors/controller/admin/get_all_students/getallstudents_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class GetAllStudentsBinding extends Bindings {
  @override
  void dependencies() {
    // Access the database instance and provide the SubjectDao
    final database = Get.find<AppDatabase>();

    // Lazy load GetallStudentsController and pass studentDao as a dependency
    Get.lazyPut<GetallStudentsController>(() => GetallStudentsController(database.studentDao));
  }
}
