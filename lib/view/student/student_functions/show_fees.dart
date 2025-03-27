import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';

class ShowFees extends StatelessWidget {
  const ShowFees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Fees',
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        automaticallyImplyLeading: true,
        centerTitle: true,
        ),
    );
  }
}