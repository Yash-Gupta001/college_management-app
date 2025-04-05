import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/add_faculty/addfaculty_binding.dart';
import 'package:flutter_flavors/controller/admin/adminscreen_binding.dart';
import 'package:flutter_flavors/controller/admin/adminscreen_controller.dart';
import 'package:flutter_flavors/controller/admin/calendar/calendarevent_binding.dart';
import 'package:flutter_flavors/controller/admin/get_all_faculty/getallfaculty_binding.dart';
import 'package:flutter_flavors/controller/admin/get_all_students/getallstudents_binding.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_binding.dart';
import 'package:flutter_flavors/startpage.dart';
import 'package:flutter_flavors/view/admin/admin_functions/add_subject_screen.dart';
import 'package:flutter_flavors/view/admin/admin_functions/branch_wise_subjects/show_all_branches.dart';
import 'package:flutter_flavors/view/admin/admin_functions/faculty-register.dart';
import 'package:flutter_flavors/view/admin/admin_functions/grant_leave.dart';
import 'package:flutter_flavors/view/admin/admin_functions/pay_slip.dart';
import 'package:flutter_flavors/view/admin/admin_functions/select_holiday.dart';
import 'package:flutter_flavors/view/admin/admin_functions/show_all_faculty.dart';
import 'package:flutter_flavors/view/admin/admin_functions/show_all_students.dart';
import 'package:flutter_flavors/common/menu_cell.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen();

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminScreenController>();

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (_lastPressed == null ||
            now.difference(_lastPressed!) > Duration(seconds: 2)) {
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
          title: "Admin Home",
          titleColor: AppColors.white,
          backgroundColor: AppColors.admin_primary,
          centerTitle: true,
          titleSpacing: 2.0,
          automaticallyImplyLeading: false,
        ),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(content: Text('Tap back again to exit')),
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Use Obx to react to menuData changes
                Obx(
                  () => Expanded(
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
                            iconColor: AppColors.admin_primary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToPage(AdminScreenController controller, int index) {
    var menuData = controller.menuData[index];
    if (menuData.title == "Pay Slip") {
      Get.to(() => PaySlip(), binding: GetAllFacultyBinding());
    } else if (menuData.title == "Select Holiday") {
      Get.to(() => SelectHoliday(), binding: CalendarEventBinding());
    } else if (menuData.title == "Grant Leave") {
      Get.to(() => GrantLeave(), binding: AdminScreenBinding());
    } else if (menuData.title == "Registered Subjects") {
      Get.to(() => ShowAllBranches(), binding: GetAllSubjectsBinding());
    } else if (menuData.title == "Add Subject") {
      Get.to(() => AddSubject(), binding: GetAllSubjectsBinding());
    } else if (menuData.title == "Add Faculty") {
      Get.to(() => FacultyRegister(), binding: AddfacultyBinding());
    } else if (menuData.title == "Show All Faculty") {
      Get.to(() => ShowAllFaculty(), binding: GetAllFacultyBinding());
    } else if (menuData.title == "Show All Students") {
      Get.to(() => ShowAllStudents(), binding: GetAllStudentsBinding());
    }
  }
}
