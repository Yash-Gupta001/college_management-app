import 'package:floor/floor.dart';
import 'package:flutter_flavors/core/local_database/entity/event_entity.dart';

@dao
abstract class EventDao {
  @Query('SELECT * FROM event_entity ORDER BY date ASC')
  Future<List<EventEntity>> getAllEvents();

  @Query('SELECT * FROM event_entity WHERE date BETWEEN :start AND :end ORDER BY date ASC')
  Future<List<EventEntity>> getEventsInRange(DateTime start, DateTime end);

  @Query('SELECT * FROM event_entity WHERE type = :type ORDER BY date ASC')
  Future<List<EventEntity>> getEventsByType(String type);

  @insert
  Future<void> insertEvent(EventEntity event);

  @update
  Future<void> updateEvent(EventEntity event);

  @delete
  Future<void> deleteEvent(EventEntity event);
}
