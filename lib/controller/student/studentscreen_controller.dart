import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';

class StudentScreenController extends GetxController {
  var menuData = RxList<MenuData>([]);
  final StudentDao studentDao;

  var loggedInStudent = Rxn<StudentEntity>();  // Holds the student data


  StudentScreenController(this.studentDao);

  Future<void> fetchStudent(String username) async {
    final student = await studentDao.findStudentByUsername(username);
    if (student != null) {
      loggedInStudent.value = student;
    }
  }

  // list of studentscreen functions
  List<MenuData> getStudentMenu() {
    const List<MenuData> studentMenu = <MenuData>[
      MenuData(title: "Apply Leave", icon: Icons.calendar_today_outlined),
      MenuData(title: "Show Attendance", icon: Icons.assignment_outlined),
      MenuData(title: "Fees", icon: Icons.payments_outlined),
      MenuData(title: "Show Holidays", icon: Icons.beach_access_outlined),
      MenuData(title: "My Course", icon: Icons.book_sharp),
    ];
    return studentMenu;
  }

  @override
  void onInit() {
    super.onInit();
    menuData.value = getStudentMenu();
    print('Menu items: ${menuData.length}');
  }
}
