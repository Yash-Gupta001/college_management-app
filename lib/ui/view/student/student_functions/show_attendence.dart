import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';

class ShowAttendence extends StatelessWidget {
  const ShowAttendence({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Show Attendance',
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        automaticallyImplyLeading: true,
        centerTitle: true,
        ),
    );
  }
}