import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CivilSubjects extends StatelessWidget {
  const CivilSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetAllSubjectsController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Civil',
        centerTitle: true,
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        // Filtering subjects that belong to the Civil branch
        final mechanicalSubjects = controller.subjects
            .where((subject) => subject.branchId == 2) // 2 is the ID for Civil
            .toList();

        if (mechanicalSubjects.isEmpty) {
          return const Center(child: Text("No subjects available for Civil."));
        }

        return ListView.builder(
          itemCount: mechanicalSubjects.length,
          itemBuilder: (context, index) {
            final subject = mechanicalSubjects[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
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
            );
          },
        );
      }),
    );
  }
}