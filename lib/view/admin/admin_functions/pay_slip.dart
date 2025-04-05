import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_faculty/getallfaculty_controller.dart';
import 'package:flutter_flavors/core/services/payment/payment_service.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class PaySlip extends StatelessWidget {
  const PaySlip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetallFacultyController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Pay Slip",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        automaticallyImplyLeading: true,
        centerTitle: true,
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
                  // payment button
                  SlidableAction(
                    onPressed: (context) {
                      // await controller.facultyDao.deleteFaculty(teacher);
                      // controller.teachers.remove(teacher);
                      Get.to(StripePaymentScreen());
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
                    "${teacher.name} ${teacher.lastname}",
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
                          Text(teacher.salary.toString()),
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