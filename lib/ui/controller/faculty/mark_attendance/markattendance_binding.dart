import 'package:flutter_flavors/ui/controller/faculty/mark_attendance/marlattendance_controller.dart';
import 'package:get/get.dart';

class MarkAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarkAttendanceController());
  }
}