import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuCell extends StatelessWidget {
  final MenuData choice;
  final Color iconColor; // New color property

  // Updated constructor to include the icon color
  MenuCell({super.key, required this.choice, this.iconColor = const Color(0xFF4169E1)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            choice.icon, 
            size: 30.0.w,
            color: iconColor,  // Use the passed color
          ),
          SizedBox(height: 2.0.h),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Text(
                choice.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 10.0.sp,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
