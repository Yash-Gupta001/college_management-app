import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/common/menu_cell.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_binding.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/view/admin/admin_functions/branch_wise_subjects/civil_subjects.dart';
import 'package:flutter_flavors/view/admin/admin_functions/branch_wise_subjects/computerscience_subjects.dart';
import 'package:flutter_flavors/view/admin/admin_functions/branch_wise_subjects/electronics_subjects.dart';
import 'package:flutter_flavors/view/admin/admin_functions/branch_wise_subjects/mechanical_subjects.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
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


/*



import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ShowAllSubjects extends StatelessWidget {
  const ShowAllSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetAllSubjectsController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "All Subjects",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        titleSpacing: 2.0,
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (controller.subjects.isEmpty) {
          return const Center(child: Text("No subjects available."));
        }

        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: controller.groupedSubjects.entries.map((entry) {
            final branch = entry.key;
            final subjects = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Branch Name Header
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColors.admin_primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    branch.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // List of Subjects under the Branch
                ...subjects.map((subject) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Slidable(
                        key: ValueKey(subject.id),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => controller.editSubject(subject),
                              backgroundColor: AppColors.green,
                              foregroundColor: AppColors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => controller.deleteSubject(subject),
                              backgroundColor: AppColors.red,
                              foregroundColor: AppColors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(subject.name),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}











*/