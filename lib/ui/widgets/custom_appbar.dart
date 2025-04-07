import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;  // New parameter for title color
  final bool centerTitle;
  final double titleSpacing;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final TextStyle? titleStyle; // Optional full style override

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.titleColor = Colors.white, // Default title color
    this.centerTitle = true,
    this.titleSpacing = 1.2,
    this.automaticallyImplyLeading = false,
    this.actions,
    this.titleStyle, // Will override titleColor if provided
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle ?? TextStyle(color: titleColor), // Use custom style or color
      ),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing.w,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      iconTheme: IconThemeData(color: titleColor), // Also change icon colors to match
    );
  }
}