
import 'package:flutter_flavors/local_database/database/app_database.dart';
import 'package:flutter_flavors/local_database/entity/events.dart';

class EventRepository {
  final AppDatabase _database;

  EventRepository(this._database);

  Future<List<Event>> getAllEvents() => _database.eventDao.getAllEvents();

  Future<List<Event>> getEventsInRange(DateTime start, DateTime end) =>
      _database.eventDao.getEventsInRange(start, end);

  Future<void> addEvent(Event event) => _database.eventDao.insertEvent(event);

  Future<void> deleteEvent(Event event) => _database.eventDao.deleteEvent(event);
}