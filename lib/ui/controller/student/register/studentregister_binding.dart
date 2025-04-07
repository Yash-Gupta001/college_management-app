
import 'package:flutter_flavors/ui/controller/student/register/studentregister_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class StudentRegisterBinding extends Bindings {
  @override
  void dependencies() {
    final database = Get.find<AppDatabase>();
    Get.lazyPut<StudentRegisterController>(() =>
        StudentRegisterController());
    Get.lazyPut(() => database.branchdao);
  }
}
