import 'package:flutter_flavors/controller/adminscreen/adminscreen_controller.dart';
import 'package:flutter_flavors/local_database/database/app_database.dart';
import 'package:get/get.dart';

class AdminScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Access the database instance and provide the SubjectDao
    final database = Get.find<AppDatabase>();

    // Lazy load AdminScreenController and pass SubjectDao as a dependency
    Get.lazyPut<AdminScreenController>(() => AdminScreenController(database.subjectDao));
  }
}
