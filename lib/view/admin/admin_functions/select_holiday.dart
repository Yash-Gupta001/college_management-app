import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/calendar/calendarevent_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectHoliday extends StatelessWidget {
  SelectHoliday({super.key});

  final CalendarEventController _controller = Get.put(CalendarEventController());
  final TextEditingController _eventNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calendar',
        backgroundColor: AppColors.admin_primary,
        automaticallyImplyLeading: true,
        titleColor: AppColors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() => TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _controller.focusedDay.value,
            calendarFormat: _controller.calendarFormat.value,
            selectedDayPredicate: (day) => 
                isSameDay(_controller.selectedDay.value, day),
            onDaySelected: (selectedDay, focusedDay) {
              _controller.selectedDay.value = selectedDay;
              _controller.focusedDay.value = focusedDay;
              _showAddEventDialog();
            },
            onFormatChanged: (format) {
              _controller.calendarFormat.value = format;
            },
            onPageChanged: (focusedDay) {
              _controller.focusedDay.value = focusedDay;
            },
            eventLoader: _controller.getEventsForDay,
            calendarStyle: CalendarStyle(
              markerDecoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.circle,
              ),
              markerSize: 12,
              markerMargin: const EdgeInsets.symmetric(horizontal: 1),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isEmpty) return const SizedBox();
                final type = (events.first as Map<String, dynamic>)['type'];
                final color = type == 'Holiday'
                    ? AppColors.blue
                    : type == 'Exam'
                        ? AppColors.red
                        : AppColors.green;
                return Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  width: 12,
                  height: 12,
                  child: Center(
                    child: Icon(
                      type == 'Holiday'
                          ? Icons.beach_access
                          : type == 'Exam'
                              ? Icons.school
                              : Icons.event,
                      color: AppColors.white,
                      size: 8,
                    ),
                  ),
                );
              },
            ),
          )),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem(AppColors.blue, 'Holiday'),
                _buildLegendItem(AppColors.red, 'Exam'),
                _buildLegendItem(AppColors.green, 'Event'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: _controller.events.length,
              itemBuilder: (context, index) {
                final event = _controller.events[index];
                return Dismissible(
                  key: Key('$index-${event['name']}'),
                  onDismissed: (direction) => _controller.removeEvent(index),
                  background: Container(color: AppColors.red),
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 4),
                    child: ListTile(
                      leading: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: event['type'] == 'Holiday'
                              ? Colors.blue
                              : event['type'] == 'Exam'
                                  ? AppColors.red
                                  : AppColors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          event['type'] == 'Holiday'
                              ? Icons.beach_access
                              : event['type'] == 'Exam'
                                  ? Icons.school
                                  : Icons.event,
                          color: AppColors.white,
                          size: 12,
                        ),
                      ),
                      title: Text(event['name']),
                      subtitle: Text('${event['type']} - ${event['date']}'),
                    ),
                  ),
                );
              },
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.selectedDay.value != null) {
            _showAddEventDialog();
          }
        },
        backgroundColor: AppColors.admin_primary,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddEventDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text('Add New Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _eventNameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => DropdownButtonFormField<String>(
              value: _controller.eventType.value,
              items: ['Holiday', 'Exam', 'Event'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) => _controller.eventType.value = value!,
              decoration: const InputDecoration(
                labelText: 'Event Type',
                border: OutlineInputBorder(),
              ),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.admin_primary
              ),
              ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_eventNameController.text.isNotEmpty && 
                  _controller.selectedDay.value != null) {
                _controller.addEvent(
                  _controller.selectedDay.value!,
                  _eventNameController.text,
                  _controller.eventType.value,
                );
                _eventNameController.clear();
                Get.back();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.admin_primary,
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                color: AppColors.white
              ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}