import 'package:get/get.dart';
import 'package:flutter_flavors/core/local_database/dao/calendareventdao.dart';
import 'package:flutter_flavors/core/local_database/entity/calendarevent_entity.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEventController extends GetxController {
  final CalendarEventDao calendarEventDao;
  var calendarFormat = CalendarFormat.month.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = Rxn<DateTime>();
  var eventType = 'Holiday'.obs;
  var events = <CalendarEventEntity>[].obs;
  final eventsMap = <DateTime, List<CalendarEventEntity>>{}.obs;

  CalendarEventController(this.calendarEventDao);

  @override
  void onInit() {
    super.onInit();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    try {
      final allEvents = await calendarEventDao.findAllEvents();
      events.assignAll(allEvents);

      for (var event in allEvents) {
        final date = DateTime(event.date.year, event.date.month, event.date.day);
        if (eventsMap[date] == null) {
          eventsMap[date] = [];
        }
        eventsMap[date]!.add(event);
      }
    } catch (e) {
      print('Error loading events: $e');
    }
  }

  List<CalendarEventEntity> getEventsForDay(DateTime day) {
    return eventsMap[day] ?? [];
  }

  Future<void> addEvent(DateTime day, String name, String type) async {
    final newEvent = CalendarEventEntity(
      id: null,
      title: name,
      date: day,
      type: type,
      description: null,
      color: 0xFF000000,
    );

    await calendarEventDao.insertEvent(newEvent);
    events.add(newEvent);

    final date = DateTime(day.year, day.month, day.day);
    eventsMap.update(date, (existingEvents) {
      existingEvents.add(newEvent);
      return existingEvents;
    }, ifAbsent: () => [newEvent]);
  }

  Future<void> removeEvent(CalendarEventEntity event) async {
    await calendarEventDao.deleteEvent(event);
    events.remove(event);

    final date = DateTime(event.date.year, event.date.month, event.date.day);
    eventsMap[date]?.remove(event);
    if (eventsMap[date]?.isEmpty ?? true) {
      eventsMap.remove(date);
    }
  }
}