import 'package:flutter_flavors/ui/controller/student/studentscreen_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class StudentScreenBinding extends Bindings {
  @override
  void dependencies() {
    final database = Get.find<AppDatabase>();  // Get database instance
    Get.lazyPut<StudentScreenController>(() => StudentScreenController(database.studentDao));
  }
}
