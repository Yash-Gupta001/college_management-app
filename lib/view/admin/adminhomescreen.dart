import 'package:flutter/material.dart';
import 'package:flutter_flavors/view/admin/admin_functions/show_all_subjects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/controller/adminscreen/adminscreen_controller.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminScreenController>();
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
        Get.snackbar('Success', 'Subject added successfully!');
      } else {
        Get.snackbar('Error', 'Please enter a valid subject name.');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Home"),
        centerTitle: true,
        titleSpacing: 1.2.w,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome, Admin!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // Input field for subject name with improved styling
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: 'Enter Subject Name',
                labelStyle: TextStyle(color: Colors.deepPurple),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
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
                child: const Text("Add Subject"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
                onPressed: (){
                  Get.to(ShowAllSubjects());
                }, 
                child: const Text("Show Subjects"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ), // Use ShowAllSubjects widget here
          ],
        ),
      ),
    );
  }
}
