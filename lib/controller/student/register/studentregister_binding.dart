import 'package:flutter_flavors/controller/student/register/studentregister_cotroller.dart';
import 'package:get/get.dart';

class StudentRegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the FacultyRegisterController
    Get.lazyPut<StudentRegisterController>(() => StudentRegisterController());
  }
}
