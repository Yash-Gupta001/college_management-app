import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/controller/admin/adminscreen_controller.dart';

class ShowAllSubjects extends StatelessWidget {
  const ShowAllSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminScreenController>();

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

        return ListView.builder(
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            final subject = controller.subjects[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(subject.name),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
