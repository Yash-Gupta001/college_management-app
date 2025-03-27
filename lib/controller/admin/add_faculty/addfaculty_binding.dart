import 'package:flutter_flavors/controller/admin/add_faculty/addfaculty_controller.dart';
import 'package:get/get.dart';

class AddfacultyBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AddFacultyController>( () => AddFacultyController());
  }
}