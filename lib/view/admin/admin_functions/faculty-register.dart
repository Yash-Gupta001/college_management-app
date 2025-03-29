import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/add_faculty/addfaculty_controller.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/core/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class FacultyRegister extends StatelessWidget {
  const FacultyRegister({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddFacultyController>();
    final subjectcontroller = Get.find<GetAllSubjectsController>();
    // final subjectcontroller = Get.find<GetAllSubjectsController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Faculty',
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Column(
          children: [
            // Name Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name',
                errorText: controller.nameError.value,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: controller.name,
            ),
            const SizedBox(height: 15),
            
            // Last Name Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                errorText: controller.lastnameError.value,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: controller.lastname,
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
            
            // Salary Field
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Salary',
                errorText: controller.salaryError.value,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                controller.salary.value = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 15),

            // Assign subject to faculty
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Subject',
                errorText: controller.subjectError.value,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // onChanged: subjectcontroller.subjects.,
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
                backgroundColor: AppColors.admin_primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: controller.isLoading.value ? null : controller.submitForm,
              child: const Text(
                'Register Faculty',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
                ),
            ),
          ],
        )),
      ),
    );
  }
}