import 'package:flutter_flavors/controller/faculty/apply_leave/facultyapplyleave_controller.dart';
import 'package:get/get.dart';

class FacultyApplyLeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplyLeaveController>(
      () => ApplyLeaveController(),
    );
  }
}