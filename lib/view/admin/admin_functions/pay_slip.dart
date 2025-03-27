import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';

class PaySlip extends StatelessWidget {
  const PaySlip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Pay Slip",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        automaticallyImplyLeading: true,
        centerTitle: true,
        ),
      
      body: Column(
        
      ),
    );
  }
}