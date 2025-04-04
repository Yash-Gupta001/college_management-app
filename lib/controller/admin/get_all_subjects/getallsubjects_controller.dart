import 'package:flutter_flavors/core/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';

class GetAllSubjectsController extends GetxController {
  final SubjectDao subjectDao;
  final BranchDao branchDao;
  var menuData = RxList<MenuData>([]);

  var subjects = <SubjectEntity>[].obs;
  var branches = <BranchEntity>[].obs;

  GetAllSubjectsController(this.subjectDao, this.branchDao);



  Future<void> _loadSubjects() async {
    final fetchedSubjects = await subjectDao.getAllSubjects();
    subjects.value = fetchedSubjects;
  }

  Future<void> _loadBranches() async {
    final fetchedBranches = await branchDao.getAllBranches();
    branches.value = fetchedBranches;
  }

  // Group subjects under respective branches
  Map<BranchEntity, List<SubjectEntity>> get groupedSubjects {
    final Map<int, BranchEntity> branchMap = {
      for (var branch in branches) branch.id!: branch
    };

    Map<BranchEntity, List<SubjectEntity>> grouped = {};
    
    for (var subject in subjects) {
      final branch = branchMap[subject.branchId];
      if (branch != null) {
        grouped.putIfAbsent(branch, () => []).add(subject);
      }
    }

    return grouped;
  }

  Future<void> insertSubject(SubjectEntity subject) async {
    final existingSubjects = await subjectDao.getAllSubjects();
    bool subjectExists = existingSubjects.any(
      (s) => s.name.toLowerCase() == subject.name.toLowerCase(),
    );

    if (subjectExists) {
      Get.snackbar('Failed', 'Subject already exists!');
    } else {
      if (subject.branchId == 0) {
        Get.snackbar('Error', 'Please select a valid branch.');
        return;
      }
      await subjectDao.insertSubject(subject);
      _loadSubjects();
    }
  }

  Future<void> deleteSubject(SubjectEntity subject) async {
    await subjectDao.deleteSubject(subject);
    _loadSubjects();
  }

  Future<void> editSubject(SubjectEntity subject) async {
    TextEditingController nameController = TextEditingController(text: subject.name);
    int selectedBranchId = subject.branchId;

    Get.defaultDialog(
      title: "Edit Subject",
      content: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Subject Name"),
          ),
          const SizedBox(height: 10),
          Obx(() => DropdownButtonFormField<int>(
                value: selectedBranchId,
                items: branches.map((branch) {
                  return DropdownMenuItem<int>(
                    value: branch.id,
                    child: Text(branch.name),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedBranchId = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'Select Branch',
                  border: OutlineInputBorder(),
                ),
              )),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            if (nameController.text.trim().isNotEmpty) {
              SubjectEntity updatedSubject = SubjectEntity(
                id: subject.id,
                name: nameController.text.trim(),
                branchId: selectedBranchId,
              );
              await subjectDao.updateSubject(updatedSubject);
              _loadSubjects();
            }
            Get.back();
          },
          child: const Text("Save"),
        ),
      ],
    );
  }

  List<MenuData> getBranchMenu() {
    const List<MenuData> adminMenu = <MenuData>[
      MenuData(title: "CSE", icon: Icons.computer),
      MenuData(title: "CIVIL", icon: Icons.engineering),
      MenuData(title: "MECHANICAL", icon: Icons.build),
      MenuData(title: "ELECTRONICS", icon: Icons.electrical_services),
    ];
    return adminMenu;
  }

 

    @override
  void onInit() {
    super.onInit();
    _loadSubjects();
    _loadBranches();
    menuData.value = getBranchMenu();
    print('Menu items: ${menuData.length}');
  }


}