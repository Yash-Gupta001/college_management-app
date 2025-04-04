import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/student/my_course/mycourse_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class MyCourse extends StatelessWidget {
  final int? studentBranchId;

  const MyCourse({super.key, required this.studentBranchId});

  @override
  Widget build(BuildContext context) {
    final MyCourseController controller = Get.find<MyCourseController>();

    if (studentBranchId == null || studentBranchId == 0) {
      return Scaffold(
        appBar: CustomAppBar(
          title: 'My Subjects',
          centerTitle: true,
          titleColor: AppColors.white,
          backgroundColor: AppColors.student_primary,
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Text(
            "No branch assigned. Please contact admin. ${studentBranchId}",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }

    // Ensure branch ID is set once before rendering UI
    controller.setStudentBranch(studentBranchId!);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Subjects',
        centerTitle: true,
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (controller.subjects.isEmpty) {
          return Center(child: Text("No subjects found for this branch."));
        }

        return ListView.builder(
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            final subject = controller.subjects[index];
            return ListTile(
              title: Text(subject.name),
              subtitle: Text("Subject ID: ${subject.id}"),
            );
          },
        );
      }),
    );
  }
}
