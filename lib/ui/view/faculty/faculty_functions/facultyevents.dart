import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/core/local_database/entity/calendarevent_entity.dart';
import 'package:flutter_flavors/ui/controller/admin/calendar/calendarevent_controller.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class Facultyevents extends StatelessWidget {
  final CalendarEventController _controller = Get.find();
  Facultyevents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Events',
        backgroundColor: AppColors.faculty_primary,
        automaticallyImplyLeading: true,
        titleColor: AppColors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
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
    );
  }

  Widget _buildEventCard(CalendarEventEntity event) {
    return Card(
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