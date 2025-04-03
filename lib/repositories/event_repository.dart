
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:flutter_flavors/core/local_database/entity/event_entity.dart';

class EventRepository {
  final AppDatabase _database;

  EventRepository(this._database);

  Future<List<EventEntity>> getAllEvents() => _database.eventDao.getAllEvents();

  Future<List<EventEntity>> getEventsInRange(DateTime start, DateTime end) =>
      _database.eventDao.getEventsInRange(start, end);

  Future<void> addEvent(EventEntity event) => _database.eventDao.insertEvent(event);

  Future<void> deleteEvent(EventEntity event) => _database.eventDao.deleteEvent(event);
}