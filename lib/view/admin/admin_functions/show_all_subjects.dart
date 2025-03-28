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
              child: Slidable(
                // Specify a key if the list can change
                key: ValueKey(subject.id),

                // The start action pane (left side for LTR languages)
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    // Edit action
                    SlidableAction(
                      onPressed: (context) {
                        controller.editSubject(subject);
                      },
                      backgroundColor: AppColors.green,
                      foregroundColor: AppColors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),

                // The end action pane (right side for LTR languages)
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    // Delete action
                    SlidableAction(
                      onPressed: (context) {
                        controller.deleteSubject(subject);
                      },
                      backgroundColor: AppColors.red,
                      foregroundColor: AppColors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),

                // The child of the Slidable is what the user sees when not sliding
                child: ListTile(
                  title: Text(subject.name),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
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
