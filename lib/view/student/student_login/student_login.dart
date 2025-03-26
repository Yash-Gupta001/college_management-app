import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/student/login/studentlogin_controller.dart';
import 'package:flutter_flavors/controller/student/register/studentregister_binding.dart';
import 'package:flutter_flavors/controller/student/studentscreen_binding.dart';
import 'package:flutter_flavors/view/student/student_register/student_register.dart';
import 'package:flutter_flavors/view/student/studenthomescreen.dart';
import 'package:flutter_flavors/widgets/custom_elevated-button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudentLogin extends StatelessWidget {
  StudentLogin({super.key});

  final StudentloginController controller = Get.put(StudentloginController());

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
                const Icon(Icons.school, size: 100, color: AppColors.student_primary),
                const SizedBox(height: 20),
                const Text(
                  'Student Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                
                // Username Field
                TextField(
                  //onChanged: (value) => controller.insert_username.value = value,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person,color: AppColors.student_primary,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Password Field
                TextField(
                  //onChanged: (value) => controller.insert_password.value = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock,color: AppColors.student_primary,),
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
                    onPressed: () {
                      Get.to(
                        () => StudentHomeScreen(),
                        binding: StudentScreenBinding(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    textColor: AppColors.white,
                    backgroundColor: AppColors.student_primary,
                    ),
                ),
                SizedBox(height: 10.0.w,),
                TextButton(
                  onPressed: (){
                    Get.to(
                        () => StudentRegister(),
                        binding: StudentRegisterBinding(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      );
                  }, 
                  child: Text("New To Campus?"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}