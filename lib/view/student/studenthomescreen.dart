import 'package:flutter/material.dart';
import 'package:flutter_flavors/controller/studentscreen/studentscreen_controller.dart';
import 'package:get/get.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen();

  @override
  Widget build(BuildContext context) {
    final controller =Get.find<StudentScreenController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Student Home")),
      body: const Center(child: Text("Welcome, Student!")),
    );
  }
}