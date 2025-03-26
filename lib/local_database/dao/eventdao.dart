import 'package:floor/floor.dart';
import 'package:flutter_flavors/local_database/entity/events.dart';

@dao
abstract class EventDao {
  @Query('SELECT * FROM events ORDER BY date ASC')
  Future<List<Event>> getAllEvents();

  @Query('SELECT * FROM events WHERE date BETWEEN :start AND :end ORDER BY date ASC')
  Future<List<Event>> getEventsInRange(DateTime start, DateTime end);

  @Query('SELECT * FROM events WHERE type = :type ORDER BY date ASC')
  Future<List<Event>> getEventsByType(String type);

  @insert
  Future<void> insertEvent(Event event);

  @update
  Future<void> updateEvent(Event event);

  @delete
  Future<void> deleteEvent(Event event);
}
