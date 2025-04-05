import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/common/menu_cell.dart';
import 'package:flutter_flavors/controller/admin/get_all_students/getallstudents_binding.dart';
import 'package:flutter_flavors/controller/student/studentscreen_controller.dart';
import 'package:flutter_flavors/startpage.dart';
import 'package:flutter_flavors/view/student/student_functions/mycourse.dart';
import 'package:flutter_flavors/view/student/student_functions/show_attendence.dart';
import 'package:flutter_flavors/view/student/student_functions/show_fees.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen();

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentScreenController>();

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (_lastPressed == null || now.difference(_lastPressed!) > Duration(seconds: 2)) {
          _lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tap back again to go to StartPage')),
          );
          return false; // Don't pop yet
        }

        // Navigate to StartPage on second back press
        Get.offAll(() => StartPage());
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Student Home",
          titleColor: AppColors.white,
          backgroundColor: AppColors.student_primary,
          centerTitle: true,
          titleSpacing: 2.0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
                          iconColor: AppColors.student_primary,
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
    );
  }

  void navigateToPage(StudentScreenController controller, int index) {
    var menuData = controller.menuData[index];
    if (menuData.title == "Apply Leave") {
      // Get.to(() => PaySlip(), binding: AdminScreenBinding());
    } else if (menuData.title == "Show Attendance") {
      Get.to(ShowAttendence());
    } else if (menuData.title == "Fees") {
      Get.to(() => ShowFees(), binding: GetAllStudentsBinding());
    } else if (menuData.title == "Show Holidays") {
      // Get.to(() => ShowAllSubjects(), binding: AdminScreenBinding());
    } else if (menuData.title == "My Course") {
      Get.to(() => MyCourse(), binding: GetAllStudentsBinding());
    }
  }
}
