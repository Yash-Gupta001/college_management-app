import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';

class FacultyApplyLeave extends StatelessWidget {
  const FacultyApplyLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Apply Leave',
        titleColor: AppColors.white,
        backgroundColor: AppColors.faculty_primary,
        automaticallyImplyLeading: true,
        ),

      body: Center(),  
    );
  }
}