import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/common/menu_cell.dart';
import 'package:flutter_flavors/ui/controller/admin/calendar/calendarevent_binding.dart';
import 'package:flutter_flavors/ui/controller/faculty/apply_leave/facultyapplyleave_binding.dart';
import 'package:flutter_flavors/ui/controller/faculty/facultyscreen_controller.dart';
import 'package:flutter_flavors/ui/controller/faculty/mark_attendance/markattendance_binding.dart';
import 'package:flutter_flavors/startpage.dart';
import 'package:flutter_flavors/ui//view/faculty/faculty_functions/facultyapply_leave.dart';
import 'package:flutter_flavors/ui/view/faculty/faculty_functions/facultyevents.dart';
import 'package:flutter_flavors/ui/view/faculty/faculty_functions/markattendence.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class FacultyHomeScreen extends StatefulWidget {
  const FacultyHomeScreen();

  @override
  State<FacultyHomeScreen> createState() => _FacultyHomeScreenState();
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {
  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FacultyScreenController>();

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (_lastPressed == null || now.difference(_lastPressed!) > Duration(seconds: 2)) {
          _lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tap back again to go to StartPage')),
          );
          return false;
        }
        Get.offAll(() => StartPage()); 
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Faculty Home",
          titleColor: AppColors.white,
          backgroundColor: AppColors.faculty_primary,
          centerTitle: true,
          titleSpacing: 2.0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Obx(() => Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0.w,
                    mainAxisSpacing: 16.0.h,
                    childAspectRatio: 1,
                  ),
                  itemCount: controller.menuData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToPage(controller, index),
                      child: MenuCell(
                        choice: controller.menuData[index],
                        iconColor: AppColors.faculty_primary,
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPage(FacultyScreenController controller, int index) {
    var menuData = controller.menuData[index];
    if (menuData.title == "Mark Attendence") {
      Get.to(() => MarkAttendance(), binding: MarkAttendanceBinding());
    } else if (menuData.title == "Pay Slip") {
      // Get.to(() => SelectHoliday(), binding: CalendarEventBinding());
    } else if (menuData.title == "Grant Leave") {
      // Get.to(() => GrantLeave(), binding: AdminScreenBinding());
    } else if (menuData.title == "Apply Leave") {
      Get.to(() => FacultyApplyLeave(), binding: FacultyApplyLeaveBinding());
    } else if (menuData.title == "Show In-Out") {
      // Get.to(() => AddSubject(), binding: GetAllSubjectsBinding());
    }else if (menuData.title == "Show Events") {
      Get.to(() => Facultyevents(), binding: CalendarEventBinding());
    }
  }
}
