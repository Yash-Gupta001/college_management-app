import 'package:flutter/material.dart';
import 'package:flutter_flavors/controller/facultyscreen/facultyscreen_binding.dart';
import 'package:flutter_flavors/controller/studentscreen/studentscreen_binding.dart';
import 'package:flutter_flavors/view/admin/adminhomescreen.dart';
import 'package:flutter_flavors/view/faculty/facultyhomescreen.dart';
import 'package:flutter_flavors/view/student/studenthomescreen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/adminscreen/adminscreen_binding.dart';

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
              opacity: 0.5, // Set the opacity here, 0.0 = fully transparent, 1.0 = fully opaque
              child: Image.asset(
                'assets/images/startpage.jpg', // Path to your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Your content on top of the background image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => AdminHomeScreen(), binding: AdminScreenBinding());
                    print("Admin Clicked");
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.admin_panel_settings, size: 100, color: Color(0xFF4169E1)),  // Royal Blue
                      Text("Admin", style: TextStyle(fontSize: 20, color: Color(0xFF4169E1))),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),  
                GestureDetector(
                  onTap: () {
                    Get.to(() => StudentHomeScreen(),binding: StudentScreenBinding());
                    print("Student Clicked");
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.school, size: 100, color: Color(0xFF32CD32)),  // Vibrant Green
                      Text("Student", style: TextStyle(fontSize: 20, color: Color(0xFF32CD32))),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(() => FacultyHomeScreen(),binding: FacultyScreenBinding());
                    print("Faculty Clicked");
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.person, size: 100, color: Color(0xFFFFA500)),  // Warm Orange
                      Text("Faculty", style: TextStyle(fontSize: 20, color: Color(0xFFFFA500))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
