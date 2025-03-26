import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';

class AdminScreenController extends GetxController {
  final SubjectDao subjectDao;
  var subjects = <SubjectEntity>[].obs;
  var menuData = RxList<MenuData>([]);

  AdminScreenController(this.subjectDao);

  // Method to insert a subject and update the list
  Future<void> insertSubject(SubjectEntity subject) async {
    await subjectDao.insertSubject(subject);
    _loadSubjects(); // Reload the subjects after adding one
  }

  // Method to load all subjects from the database
  Future<void> _loadSubjects() async {
    final fetchedSubjects = await subjectDao.getAllSubjects();
    subjects.value = fetchedSubjects; // Update the observable list
  }

  //
  List<MenuData> getAdminMenu() {
  const List<MenuData> adminMenu = <MenuData>[
    MenuData(title: "Pay Slip", icon: Icons.account_balance_wallet),
    MenuData(title: "Select Holiday", icon: Icons.calendar_today),
    MenuData(title: "Grant Leave", icon: Icons.local_hotel),
    MenuData(title: "Registered Subjects", icon: Icons.school),
    MenuData(title: "Add Subject", icon: Icons.add_circle),
  ];
  return adminMenu;
}



  @override
  void onInit() {
    super.onInit();
    menuData.value = getAdminMenu();
    print('Menu items: ${menuData.length}'); // Debug print
    _loadSubjects();
  }
}
