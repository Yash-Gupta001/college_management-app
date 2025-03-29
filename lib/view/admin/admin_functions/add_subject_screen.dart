import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';

class AddSubject extends StatelessWidget {
  const AddSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetAllSubjectsController>(); // Fetch the controller
    final TextEditingController subjectController = TextEditingController();

    // Handle adding a subject
    void addSubject() {
      String subjectName = subjectController.text;
      if (subjectName.isNotEmpty) {
        // Create a new subject entity
        SubjectEntity newSubject = SubjectEntity(name: subjectName);

        // Call the insertSubject method
        controller.insertSubject(newSubject);

        // Clear the text field and show a confirmation snackbar
        subjectController.clear();
      } else {
        Get.snackbar('Error', 'Please enter a valid subject name.');
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Subjects",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        titleSpacing: 2.0,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Input field for subject name 
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: 'Enter Subject Name',
                labelStyle: TextStyle(color: AppColors.admin_primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.admin_primary, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.admin_primary, width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              ),
            ),
            const SizedBox(height: 20),
            // Add Subject Button with custom styling
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addSubject,
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.admin_primary,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Add Subject"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
