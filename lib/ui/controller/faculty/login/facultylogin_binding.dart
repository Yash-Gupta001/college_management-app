import 'package:flutter_flavors/ui/controller/faculty/login/facultylogin_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class FacultyLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacultyDao>(() => Get.find<AppDatabase>().facultyDao);
    // Then create the controller
    Get.lazyPut<FacultyloginController>(() => FacultyloginController());
  }
}