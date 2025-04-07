import 'package:floor/floor.dart';
import 'package:get/get.dart';

class MarkAttendanceController extends GetxController {
  // Define any necessary variables and methods for the controller here
  // For example, you might want to manage attendance data or handle user interactions
  var attendanceData = [].obs; // Example observable list for attendance data

  void markAttendance(String studentId) {
    // Logic to mark attendance for a student
    attendanceData.add(studentId);
    update; // Notify listeners about the change
  }

  void clearAttendance() {
    attendanceData.clear();
    update; // Notify listeners about the change
  }
}