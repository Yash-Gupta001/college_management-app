import 'package:flutter_flavors/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GetAllSubjectsController extends GetxController {
  final SubjectDao subjectDao;
  var subjects = <SubjectEntity>[].obs;

  GetAllSubjectsController(this.subjectDao);

  // Method to insert a subject and update the list
  Future<void> insertSubject(SubjectEntity subject) async {
    // Check if the subject already exists
    final existingSubjects = await subjectDao.getAllSubjects();
    bool subjectExists = existingSubjects.any(
      (s) => s.name.toLowerCase() == subject.name.toLowerCase(),
    ); // Assuming 'id' is the unique key
    if (subjectExists) {
      Get.snackbar('Failed', 'Subject Already exists!');
    } else {
      await subjectDao.insertSubject(subject);
      Get.snackbar('Success', 'Subject added successfully!');
      _loadSubjects(); // Reload the subjects after adding one
    }
  }

  // Method to delete a subject and update the list
  Future<void> deleteSubject(SubjectEntity subject) async {
    await subjectDao.deleteSubject(subject);
    _loadSubjects(); // Reload the subjects after deleting one
  }

  // Method to Edit Subject Name
  Future<void> editSubject(SubjectEntity subject) async {
    TextEditingController nameController = TextEditingController(
      text: subject.name,
    );

    Get.defaultDialog(
      title: "Edit Subject",
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Subject Name"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // Close dialog
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            if (nameController.text.trim().isNotEmpty) {
              // Update the subject in the database
              SubjectEntity updatedSubject = SubjectEntity(
                id: subject.id,
                name: nameController.text.trim(),
              );
              await subjectDao.updateSubject(updatedSubject);

              _loadSubjects(); // Refresh the list
            }
            Get.back(); // Close dialog
          },
          child: Text("Save"),
        ),
      ],
    );
  }

  // Method to load all subjects from the database
  Future<void> _loadSubjects() async {
    final fetchedSubjects = await subjectDao.getAllSubjects();
    subjects.value = fetchedSubjects; // Update the observable list
  }

  @override
  void onInit() {
    super.onInit();
    _loadSubjects();
  }
}
