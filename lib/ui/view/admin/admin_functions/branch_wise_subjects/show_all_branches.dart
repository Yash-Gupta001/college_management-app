import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/common/menu_cell.dart';
import 'package:flutter_flavors/ui/controller/admin/get_all_subjects/getallsubjects_binding.dart';
import 'package:flutter_flavors/ui/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/ui/view/admin/admin_functions/branch_wise_subjects/civil_subjects.dart';
import 'package:flutter_flavors/ui/view/admin/admin_functions/branch_wise_subjects/computerscience_subjects.dart';
import 'package:flutter_flavors/ui/view/admin/admin_functions/branch_wise_subjects/electronics_subjects.dart';
import 'package:flutter_flavors/ui/view/admin/admin_functions/branch_wise_subjects/mechanical_subjects.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowAllBranches extends StatelessWidget {
  const ShowAllBranches({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetAllSubjectsController>();

    void navigateToPage(GetAllSubjectsController controller, int index) {
      var menuData = controller.menuData[index];
      if (menuData.title == "CSE") {
        Get.to(
          () => ComputerScienceSubjects(),
          binding: GetAllSubjectsBinding(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300),
        );
      } else if (menuData.title == "CIVIL") {
        Get.to(
          () => CivilSubjects(),
          binding: GetAllSubjectsBinding(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300),
        );
      } else if (menuData.title == "MECHANICAL") {
        Get.to(
          () => MechanicalSubjects(),
          binding: GetAllSubjectsBinding(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300),
        );
      } else if (menuData.title == "ELECTRONICS") {
        Get.to(
          () => ElectronicsSubjects(),
          binding: GetAllSubjectsBinding(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300),
        );
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: "All Branches",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
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
    );
  }
}
