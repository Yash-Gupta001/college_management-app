import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/login/adminlogin_controller.dart';
import 'package:flutter_flavors/widgets/custom_elevated-button.dart';
import 'package:get/get.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final AdminLoginController controller = Get.put(AdminLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo/Title
                const Icon(Icons.admin_panel_settings, size: 100, color: AppColors.admin_primary),
                const SizedBox(height: 20),
                const Text(
                  'Admin Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                
                // Username Field
                TextField(
                  onChanged: (value) => controller.insert_username.value = value,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person,color: AppColors.admin_primary,),
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
                    prefixIcon: const Icon(Icons.lock,color: AppColors.admin_primary,),
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
                    onPressed: controller.Validate,
                    textColor: AppColors.white,
                    backgroundColor: AppColors.admin_primary,
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}