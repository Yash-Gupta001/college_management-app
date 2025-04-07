import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';

class GrantLeave extends StatelessWidget {
  const GrantLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Grant Leave',
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        automaticallyImplyLeading: true,
        ),
    );
  }
}