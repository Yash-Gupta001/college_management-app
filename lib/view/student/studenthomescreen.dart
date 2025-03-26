import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/common/menu_cell.dart';
import 'package:flutter_flavors/controller/student/studentscreen_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen();

 @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentScreenController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Student Home",
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        centerTitle: true,
        titleSpacing: 2.0,
        automaticallyImplyLeading: false,
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to exit'),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Use Obx to react to menuData changes
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
                      onTap: () {}, 
                      //navigateToPage(controller, index),
                      child: MenuCell(
                        choice: controller.menuData[index],
                        iconColor: AppColors.student_primary,),
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

  // void navigateToPage(AdminScreenController controller, int index) {
  //   var menuData = controller.menuData[index];
  //   if (menuData.title == "Pay Slip") {
  //     Get.to(() => PaySlip(), binding: AdminScreenBinding());
  //   } else if (menuData.title == "Select Holiday") {
  //     Get.to(() => SelectHoliday(), binding: CalendarEventBinding());
  //   } else if (menuData.title == "Grant Leave") {
  //     Get.to(() => GrantLeave(), binding: AdminScreenBinding());
  //   } else if (menuData.title == "Registered Subjects") {
  //     Get.to(() => ShowAllSubjects(), binding: AdminScreenBinding());
  //   } else if (menuData.title == "Add Subject") {
  //     Get.to(() => AddSubject(), binding: AdminScreenBinding());
  //   }
  // }
}
