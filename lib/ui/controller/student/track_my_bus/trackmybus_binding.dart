import 'package:flutter_flavors/ui/controller/student/track_my_bus/trackmybus_controller.dart';
import 'package:get/get.dart';

class TrackMyBusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackMyBusController>(() => TrackMyBusController(),);
  }
}