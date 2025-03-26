import 'package:flutter_flavors/controller/faculty/login/facultylogin_controller.dart';
import 'package:get/get.dart';

class FacultyLoginBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the FacultyloginController
    Get.lazyPut<FacultyloginController>(() => FacultyloginController());
  }
}
