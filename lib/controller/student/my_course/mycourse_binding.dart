import 'package:flutter_flavors/controller/student/my_course/mycourse_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class MyCourseBinding extends Bindings{
  @override
  void dependencies() {
    final database = Get.find<AppDatabase>();
    // TODO: implement dependencies
    Get.lazyPut<MyCourseController>(() => MyCourseController(database.branchdao, database.subjectDao));
  }
}