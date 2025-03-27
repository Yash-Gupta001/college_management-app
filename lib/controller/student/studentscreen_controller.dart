import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';
import 'package:get/get.dart';

class StudentScreenController extends GetxController {
  var menuData = RxList<MenuData>([]);

  // list of studentscreen functions
  List<MenuData> getStudentMenu() {
    const List<MenuData> studentMenu = <MenuData>[
      MenuData(title: "Apply Leave", icon: Icons.calendar_today_outlined),
      MenuData(title: "Show Attendance", icon: Icons.assignment_outlined),
      MenuData(title: "Fees", icon: Icons.payments_outlined),
      MenuData(title: "Show Holidays", icon: Icons.beach_access_outlined),
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
