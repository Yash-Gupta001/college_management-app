import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_faculty/getallfaculty_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ShowAllFaculty extends StatelessWidget {
  const ShowAllFaculty({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetallFacultyController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "All Teachers",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        titleSpacing: 2.0,
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (controller.teachers.isEmpty) {
          return const Center(child: Text("No Teacher Registered."));
        }
        return ListView.builder(
          itemCount: controller.teachers.length,
          itemBuilder: (context, index) {
            final teacher = controller.teachers[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                extentRatio: 0.25,
                children: [
                  // Delete button
                  SlidableAction(
                    onPressed: (context) async {
                      await controller.facultyDao.deleteFaculty(teacher);
                      controller.teachers.remove(teacher);
                    },
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  // Edit button
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
              child: Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: ListTile(
                  title: Text(
                    "${teacher.name} ${teacher.lastname}",
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
                          Text(teacher.contactNo),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.email, size: 16, color: AppColors.red),
                          SizedBox(width: 4),
                          Text(teacher.email),
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
                          String phoneUrl = "tel:${teacher.contactNo}";
                          launchUrl(Uri.parse(phoneUrl));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email, color: AppColors.red),
                        onPressed: () {
                          String emailUrl = "mailto:${teacher.email}";
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
