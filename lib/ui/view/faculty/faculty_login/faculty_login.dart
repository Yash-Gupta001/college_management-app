import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/controller/faculty/login/facultylogin_controller.dart';
import 'package:flutter_flavors/ui/widgets/custom_elevated-button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FacultyLogin extends StatelessWidget {
  FacultyLogin({super.key});

  final FacultyloginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo/Title
                  const Icon(Icons.person, size: 100, color: AppColors.faculty_primary),
                  const SizedBox(height: 20),
                  const Text(
                    'Faculty Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  
                  // Username Field
                  TextField(
                    onChanged: (value) => controller.insert_username.value = value,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: const Icon(Icons.person, color: AppColors.faculty_primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Password Field
                  TextField(
                    onChanged: (value) => controller.insert_password.value = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock, color: AppColors.faculty_primary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: 'Login', 
                      onPressed: controller.validate,
                      textColor: AppColors.white,
                      backgroundColor: AppColors.faculty_primary,
                    ),
                  ),
                  SizedBox(height: 10.0.w),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}