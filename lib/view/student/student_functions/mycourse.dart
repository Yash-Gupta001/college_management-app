import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_students/getallstudents_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetallStudentsController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "My Subjects",
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        centerTitle: true,
        titleSpacing: 2.0,
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        final subjects = controller.subjectsWithBranchfiltered;

        if (subjects.isEmpty) {
          return const Center(child: Text("No subjects Found."));
        }

        return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(subject['subject'] ?? 'Subject'),
                // subtitle: Text(
                //   'Branch: ${subject['branch'] ?? 'Unknown'}'
                //   ),
                leading: const Icon(Icons.book, color: Colors.deepPurple),
              ),
            );
          },
        );
      }),
    );
  }
}
