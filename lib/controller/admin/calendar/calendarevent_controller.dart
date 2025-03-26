import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEventController extends GetxController {
  var calendarFormat = CalendarFormat.month.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = Rxn<DateTime>();
  var eventType = 'Holiday'.obs;
  var events = <Map<String, dynamic>>[].obs;
  
  final _eventsMap = <DateTime, List<Map<String, dynamic>>>{};

  List<Map<String, dynamic>> getEventsForDay(DateTime day) {
    return _eventsMap[day] ?? [];
  }

  void addEvent(DateTime day, String name, String type) {
    final event = {
      'name': name,
      'type': type,
      'date': DateFormat('yyyy-MM-dd').format(day),
    };

    events.add(event);
    
    if (_eventsMap[day] == null) {
      _eventsMap[day] = [];
    }
    _eventsMap[day]!.add(event);
  }

  void removeEvent(int index) {
    final event = events.removeAt(index);
    final date = DateFormat('yyyy-MM-dd').parse(event['date']);
    _eventsMap[date]?.removeWhere((e) => e['name'] == event['name']);
  }
}