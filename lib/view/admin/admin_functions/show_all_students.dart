import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_students/getallstudents_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
          return const Center(child: Text("No Student Found."));
        }
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            final students = controller.students[index];
            return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  // Delete button
                  SlidableAction(
                    onPressed: (context) async {
                      await controller.studentDao.deleteStudent(students);
                      controller.students.remove(students);
                    },
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),

              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Add edit functionality if needed
                    },
                    backgroundColor: AppColors.green,
                    foregroundColor: AppColors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),

              // Edit button
              child: Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: ListTile(
                  title: Text(
                    "${students.name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 16, color: AppColors.blue),
                          SizedBox(width: 4),
                          Text(students.contactNo),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.email, size: 16, color: AppColors.red),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              students.username + "@college.com",
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, color: AppColors.blue),
                        onPressed: () {
                          String phoneUrl = "tel:${students.contactNo}";
                          launchUrl(Uri.parse(phoneUrl));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email, color: AppColors.red),
                        onPressed: () {
                          String emailUrl =
                              "mailto:${students.username + "@college.com"}";
                          launchUrl(Uri.parse(emailUrl));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
