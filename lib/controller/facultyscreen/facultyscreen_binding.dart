import 'package:flutter_flavors/controller/facultyscreen/facultyscreen_controller.dart';
import 'package:get/get.dart';

class FacultyScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the AdminScreenController
    Get.lazyPut<FacultyScreenController>(() => FacultyScreenController());
  }
}
