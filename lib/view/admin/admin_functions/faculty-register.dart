import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/add_faculty/addfaculty_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class FacultyRegister extends StatelessWidget {
  const FacultyRegister ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddFacultyController>();
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Add Faculty',
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        automaticallyImplyLeading: true,
        ),
      
      body: Column(
        
      ),
    );
  }
}