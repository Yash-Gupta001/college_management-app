import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/controller/admin/get_all_students/getallstudents_controller.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ShowFees extends StatelessWidget {
  const ShowFees({super.key});

 @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetallStudentsController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Fees",
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        automaticallyImplyLeading: true,
        centerTitle: true,
        ),
      
      body: Obx(() {
        if (controller.students.isEmpty) {
          return const Center(child: Text("No Teacher Registered."));
        }
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            final students = controller.students[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                extentRatio: 0.25,
                children: [
                  // payment button
                  SlidableAction(
                    onPressed: (context) {
                      // await controller.facultyDao.deleteFaculty(teacher);
                      // controller.teachers.remove(teacher);
                    },
                    backgroundColor: AppColors.green,
                    foregroundColor: AppColors.white,
                    icon: Icons.payments_sharp,
                    label: 'pay',
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
                    "${students.name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.payments_sharp, size: 16, color: AppColors.green),
                          SizedBox(width: 4),
                          Text(students.fees.toString()),
                        ],
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: AppColors.green),
                        onPressed: () {
                          
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