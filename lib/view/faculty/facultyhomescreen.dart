import 'package:flutter/material.dart';
import 'package:flutter_flavors/controller/facultyscreen/facultyscreen_controller.dart';
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

      body: const Center(child: Text("Welcome, Faculty!")),
    );
  }
}