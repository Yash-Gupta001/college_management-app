import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/calendarevent_entity.dart';

@dao
abstract class CalendarEventDao {
  @Query('SELECT * FROM calendarevents_entity')
  Future<List<CalendarEventEntity>> findAllEvents();

  @insert
  Future<void> insertEvent(CalendarEventEntity event);

  @delete
  Future<void> deleteEvent(CalendarEventEntity event);
}