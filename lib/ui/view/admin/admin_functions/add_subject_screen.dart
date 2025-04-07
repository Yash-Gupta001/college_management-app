import 'package:flutter/material.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:flutter_flavors/ui/widgets/custom_elevated-button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({Key? key}) : super(key: key);

  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final controller = Get.find<GetAllSubjectsController>();
  final TextEditingController subjectController = TextEditingController();

  int? selectedBranchId;
  List<BranchEntity> branches = [];

  @override
  void initState() {
    super.initState();
    fetchBranches();
  }

  void fetchBranches() async {
    final database = Get.find<AppDatabase>(); // Get database instance
    final branchDao = database.branchdao; // Get BranchDao

    branches = await branchDao.getAllBranches(); // Fetch branches from DB
    setState(() {}); // Refresh UI
  }

  void addSubject() {
    String subjectName = subjectController.text;

    if (subjectName.isNotEmpty && selectedBranchId != null) {
      SubjectEntity newSubject = SubjectEntity(
        name: subjectName,
        branchId: selectedBranchId!,
      );

      controller.insertSubject(newSubject);

      subjectController.clear();
      setState(() {
        selectedBranchId = null;
      });

      Get.snackbar('Success', 'Subject added successfully.');
    } else {
      Get.snackbar('Error', 'Please enter a subject name and select a branch.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Subject",
        titleColor: AppColors.white,
        backgroundColor: AppColors.admin_primary,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Subject Name Input
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: 'Enter Subject Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown for Branch Selection (Dynamic)
            DropdownButtonFormField<int>(
              value: selectedBranchId,
              items:
                  branches.map((branch) {
                    return DropdownMenuItem<int>(
                      value: branch.id,
                      child: Text(branch.name),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBranchId = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Branch',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Add Subject Button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressed: addSubject,
                text: 'Add Subject',
                textColor: AppColors.white,
                backgroundColor: AppColors.admin_primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
