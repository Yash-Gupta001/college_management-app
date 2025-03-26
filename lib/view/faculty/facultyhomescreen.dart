import 'package:flutter/material.dart';
import 'package:flutter_flavors/controller/faculty/facultyscreen_controller.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'package:get/get.dart';

class FacultyHomeScreen extends StatelessWidget {
  const FacultyHomeScreen();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FacultyScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Faculty Home",
          
          ),
      centerTitle: true,
      ),

      body:DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to exit'),
        ),

        child: Center(
          child: Text(
            "Welcome, Faculty!"
            )),
        
        ),
    );
  }
}