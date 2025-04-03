import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppBar(
        title: 'title',
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        automaticallyImplyLeading: true,
        ),


    );
  }
}