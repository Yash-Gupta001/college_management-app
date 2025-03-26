import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/login/adminlogin_binding.dart';
import 'package:flutter_flavors/controller/faculty/login/facultylogin_binding.dart';
import 'package:flutter_flavors/controller/student/login/stuentlogin_binding.dart';
import 'package:flutter_flavors/view/admin/admin_login/admin_login.dart';
import 'package:flutter_flavors/view/faculty/faculty_login/faculty_login.dart';
import 'package:flutter_flavors/view/student/student_login/student_login.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/startpage.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Your content on top of the background image
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Admin Button
                  _buildRoleButton(
                    icon: Icons.admin_panel_settings,
                    label: "Admin",
                    color: AppColors.admin_primary,
                    onTap: () {
                      Get.to(
                        () => AdminLogin(),
                        binding: AdminloginBinding(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                      print("Admin Clicked");
                    },
                  ),
                  SizedBox(height: 20.h),
                  // Student Button
                  _buildRoleButton(
                    icon: Icons.school,
                    label: "Student",
                    color: AppColors.student_primary,
                    onTap: () {
                      Get.to(
                        () => StudentLogin(),
                        binding: StudentLoginBinding(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                      print("Student Clicked");
                    },
                  ),
                  SizedBox(height: 20.h),
                  // Faculty Button
                  _buildRoleButton(
                    icon: Icons.person,
                    label: "Faculty",
                    color: AppColors.faculty_primary,
                    onTap: () {
                      Get.to(
                        () => FacultyLogin(),
                        binding: FacultyLoginBinding(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                      print("Faculty Clicked");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable button widget
  Widget _buildRoleButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2.w),
            ),
            child: Icon(icon, size: 50.w, color: color),
          ),
          SizedBox(height: 10.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}