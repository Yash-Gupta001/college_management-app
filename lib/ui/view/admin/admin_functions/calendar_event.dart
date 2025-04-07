import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/core/local_database/entity/calendarevent_entity.dart';
import 'package:flutter_flavors/ui/controller/admin/calendar/calendarevent_controller.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEvent extends StatelessWidget {
  final CalendarEventController _controller = Get.find();
  final TextEditingController eventNameController = TextEditingController();

  CalendarEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calendar Events',
        backgroundColor: AppColors.admin_primary,
        automaticallyImplyLeading: true,
        titleColor: AppColors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _controller.focusedDay.value,
                calendarFormat: _controller.calendarFormat.value,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: AppColors.admin_primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: AppColors.admin_primary),
                  weekendStyle: TextStyle(color: AppColors.red),
                ),
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
                  todayDecoration: BoxDecoration(
                    color: AppColors.admin_primary.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.admin_primary,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: AppColors.admin_primary,
                    shape: BoxShape.circle,
                  ),
                  markerSize: 10,
                  markerMargin: const EdgeInsets.symmetric(horizontal: 1),
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isEmpty) return const SizedBox();
                    final type = (events.first as CalendarEventEntity).type;
                    final color = _getEventColor(type);
                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      width: 16,
                      height: 16,
                      child: Center(
                        child: Icon(
                          _getEventIcon(type),
                          color: AppColors.white,
                          size: 10,
                        ),
                      ),
                    );
                  },
                ),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _buildLegendItem(AppColors.blue, 'Holiday'),
                _buildLegendItem(AppColors.red, 'Exam'),
                _buildLegendItem(AppColors.green, 'Event'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() => _controller.events.isEmpty
                ? Center(
                    child: Text(
                      'No events added yet',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: _controller.events.length,
                    itemBuilder: (context, index) {
                      final event = _controller.events[index];
                      return _buildEventCard(event);
                    },
                  )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.selectedDay.value != null) {
            _showAddEventDialog();
          } else {
            Get.snackbar(
              'Select a date',
              'Please select a date first',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.admin_primary.withOpacity(0.8),
              colorText: AppColors.white,
            );
          }
        },
        backgroundColor: AppColors.admin_primary,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  Widget _buildEventCard(CalendarEventEntity event) {
    return Dismissible(
      key: Key('${event.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: AppColors.red),
      ),
      confirmDismiss: (direction) async {
        return await Get.dialog(
          AlertDialog(
            title: const Text('Confirm Delete'),
            content: Text('Are you sure you want to delete "${event.title}"?'),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: const Text('Delete', style: TextStyle(color: AppColors.red)),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) => _controller.removeEvent(event),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _getEventColor(event.type),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getEventIcon(event.type),
              color: AppColors.white,
              size: 18,
            ),
          ),
          title: Text(
            event.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            '${event.type} • ${_formatDate(event.date)}',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: AppColors.admin_primary),
            onPressed: () => _showEditEventDialog(event),
          ),
        ),
      ),
    );
  }

  void _showAddEventDialog() {
    eventNameController.clear();
    _controller.eventType.value = 'Event';
    
    _showEventDialog(
      title: 'Add New Event',
      onConfirm: () {
        if (eventNameController.text.isNotEmpty) {
          _controller.addEvent(
            _controller.selectedDay.value!,
            eventNameController.text,
            _controller.eventType.value,
          );
          eventNameController.clear();
          Get.back();
        }
      },
    );
  }

  void _showEditEventDialog(CalendarEventEntity event) {
    eventNameController.text = event.title;
    _controller.eventType.value = event.type;
    _controller.selectedDay.value = event.date;
    
    _showEventDialog(
      title: 'Edit Event',
      onConfirm: () {
        // if (eventNameController.text.isNotEmpty) {
        //   _controller.updateEvent(
        //     event,
        //     eventNameController.text,
        //     _controller.eventType.value,
        //     _controller.selectedDay.value!,
        //   );
        //   eventNameController.clear();
        //   Get.back();
        // }
      },
    );
  }

  void _showEventDialog({
    required String title,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(title, style: TextStyle(color: AppColors.admin_primary)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: eventNameController,
              decoration: InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.admin_primary),
                  borderRadius: BorderRadius.circular(12),
                ),
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
              decoration: InputDecoration(
                labelText: 'Event Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.admin_primary),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.admin_primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Save', style: TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Chip(
      backgroundColor: color.withOpacity(0.2),
      label: Text(text, style: TextStyle(color: color)),
      avatar: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Color _getEventColor(String type) {
    switch (type) {
      case 'Holiday':
        return AppColors.blue;
      case 'Exam':
        return AppColors.red;
      case 'Event':
      default:
        return AppColors.green;
    }
  }

  IconData _getEventIcon(String type) {
    switch (type) {
      case 'Holiday':
        return Icons.beach_access;
      case 'Exam':
        return Icons.school;
      case 'Event':
      default:
        return Icons.event;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}