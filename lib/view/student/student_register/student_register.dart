import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/controller/student/register/studentregister_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class StudentRegister extends StatelessWidget {
  const StudentRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentRegisterController>();
    // final subjectcontroller = Get.find<GetAllSubjectsController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Register',
        backgroundColor: AppColors.student_primary,
        titleColor: AppColors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            children: [
              // Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: controller.nameError.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: controller.name,
              ),
              const SizedBox(height: 15),

              // Username Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: controller.usernameError.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: controller.username,
              ),
              const SizedBox(height: 15),

              // Email Field
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: controller.emailError.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: controller.email,
              ),
              const SizedBox(height: 15),

              // Password Field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: controller.passwordError.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: controller.password,
              ),
              const SizedBox(height: 15),

              // Contact Number Field
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  errorText: controller.contactNoError.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: controller.contactNo,
              ),
              const SizedBox(height: 30),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.student_primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed:
                      controller.isLoading.value ? null : controller.submitForm,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
