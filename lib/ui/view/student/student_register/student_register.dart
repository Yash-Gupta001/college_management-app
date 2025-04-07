import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/controller/student/register/studentregister_controller.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';

class StudentRegister extends StatelessWidget {
  const StudentRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentRegisterController>();

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                onChanged: (value) => controller.name.value = value,
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
                onChanged: (value) => controller.username.value = value,
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
                onChanged: (value) => controller.password.value = value,
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
                onChanged: (value) => controller.contactNo.value = value,
              ),
              const SizedBox(height: 15),

              // Branch Dropdown
              DropdownButtonFormField<BranchEntity>(
  isExpanded: true,
  decoration: InputDecoration(
    labelText: 'Select Branch',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  value: controller.selectedBranch.value,
  items: controller.branches.map((branch) {
    return DropdownMenuItem<BranchEntity>(
      value: branch,
      child: Text(branch.name),
    );
  }).toList(),
  onChanged: (value) {
    controller.selectedBranch.value = value;
    controller.selectedBranch.refresh(); // Force UI update
  },
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
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.submitForm,
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
