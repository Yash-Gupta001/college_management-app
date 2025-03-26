import 'package:flutter_flavors/controller/student/studentscreen_controller.dart';
import 'package:get/get.dart';

class StudentScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the StudentScreenController
    Get.lazyPut<StudentScreenController>(() => StudentScreenController());
  }
}
