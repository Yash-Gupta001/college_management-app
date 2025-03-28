import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';
import 'package:get/get.dart';

class AdminScreenController extends GetxController {
  var menuData = RxList<MenuData>([]);
  //
  List<MenuData> getAdminMenu() {
  const List<MenuData> adminMenu = <MenuData>[
    MenuData(title: "Pay Slip", icon: Icons.account_balance_wallet),
    MenuData(title: "Select Holiday", icon: Icons.calendar_today),
    MenuData(title: "Grant Leave", icon: Icons.local_hotel),
    MenuData(title: "Registered Subjects", icon: Icons.menu_book_sharp),
    MenuData(title: "Add Subject", icon: Icons.add_circle),
    MenuData(title: "Add Faculty", icon: Icons.person_add),
    MenuData(title: "Show All Faculty", icon: Icons.people_alt),
    MenuData(title: "Show All Students", icon: Icons.school)
  ];
  return adminMenu;
}

  @override
  void onInit() {
    super.onInit();
    menuData.value = getAdminMenu();
    print('Menu items: ${menuData.length}'); // Debug print
  }
}
