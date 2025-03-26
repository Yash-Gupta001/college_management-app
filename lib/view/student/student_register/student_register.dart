import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';

class StudentRegister extends StatelessWidget {
  const StudentRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Register',
        backgroundColor: AppColors.student_primary,
        titleColor: AppColors.white,
        centerTitle: true,
        ),
      
      body: Center(
        child: Text('data'),
      ),
    );
  }
}