import 'package:flutter_flavors/controller/student/login/studentlogin_controller.dart';
import 'package:get/get.dart';

class StudentLoginBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the StudentloginController
    Get.lazyPut<StudentloginController>(() => StudentloginController());
  }
}
