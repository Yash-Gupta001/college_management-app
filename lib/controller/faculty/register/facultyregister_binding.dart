import 'package:flutter_flavors/controller/faculty/register/facultyregister_controller.dart';
import 'package:get/get.dart';

class FacultyRegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the FacultyRegisterController
    Get.lazyPut<FacultyRegisterController>(() => FacultyRegisterController());
  }
}
