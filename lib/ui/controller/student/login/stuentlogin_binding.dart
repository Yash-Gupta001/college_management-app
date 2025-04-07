import 'package:flutter_flavors/ui/controller/student/login/studentlogin_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class StudentLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDao>(() => Get.find<AppDatabase>().studentDao);
    // Then create the controller
    Get.lazyPut<StudentloginController>(() => StudentloginController());
  }
}
