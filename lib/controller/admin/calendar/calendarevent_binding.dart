import 'package:flutter_flavors/controller/admin/calendar/calendarevent_controller.dart';
import 'package:get/get.dart';

class CalendarEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarEventController>(() => CalendarEventController());
  }
}
