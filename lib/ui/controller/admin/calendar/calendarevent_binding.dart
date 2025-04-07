import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:flutter_flavors/ui/controller/admin/calendar/calendarevent_controller.dart';
import 'package:get/get.dart';

class CalendarEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarEventController>(() {
      final database = Get.find<AppDatabase>();
      return CalendarEventController(database.calendarEventDao);
    });
  }
}