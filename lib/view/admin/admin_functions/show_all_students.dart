import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_students/getallstudents_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class ShowAllStudents extends StatelessWidget {
  const ShowAllStudents({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetallStudentsController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "All Students",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        titleSpacing: 2.0,
        automaticallyImplyLeading: true,
      ),

      body: Obx(() {
        if (controller.students.isEmpty) {
          return const Center(child: Text("No student Registered."));
        }
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.students[index].name),
            );
          },
        );
      }),
    );
  }
}