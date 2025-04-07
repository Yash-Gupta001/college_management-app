import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/controller/admin/get_all_faculty/getallfaculty_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
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
          return const Center(child: Text("No Teacher Found."));
        }
        return ListView.builder(
          itemCount: controller.teachers.length,
          itemBuilder: (context, index) {
            final teacher = controller.teachers[index];
            final branchName =
                controller.branchNames[teacher.name] ??
                "Loading..."; // Get branch name

            return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
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
                ],
              ),

              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Edit functionality
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
                          Icon(
                            Icons.menu_book_sharp,
                            size: 16,
                            color: AppColors.green,
                          ),
                          SizedBox(width: 4),
                          Text(teacher.subject),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.account_balance,
                            size: 16,
                            color: AppColors.purple,
                          ),
                          SizedBox(width: 4),
                          Text(branchName),
                        ],
                      ),
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
                          Flexible(
                            child: Text(
                              "${teacher.username}@college.com",
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
                          String phoneUrl = "tel:${teacher.contactNo}";
                          launchUrl(Uri.parse(phoneUrl));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email, color: AppColors.red),
                        onPressed: () {
                          String emailUrl =
                              "mailto:${teacher.username}@college.com";
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
