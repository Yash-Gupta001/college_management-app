import 'package:flutter/material.dart';
import 'package:flutter_flavors/model/menu_data.dart';
import 'package:get/get.dart';


class FacultyScreenController extends GetxController{
  var menuData = RxList<MenuData>([]);
  //
  List<MenuData> getFacultyMenu() {
  const List<MenuData> FacultyMenu = <MenuData>[
    MenuData(title: "Pay Slip", icon: Icons.account_balance_wallet),
    MenuData(title: "Grant Leave", icon: Icons.local_hotel),
    MenuData(title: "Apply Leave", icon: Icons.calendar_today_outlined),
    MenuData(title: "Show In-Out", icon: Icons.assignment_outlined),
    MenuData(title: "Show Holidays", icon: Icons.beach_access_outlined),
    MenuData(title: "Mark Attendence", icon: Icons.assignment_turned_in),
    MenuData(title: "Grant Leave", icon: Icons.local_hotel),
  ];
  return FacultyMenu;
}

  @override
  void onInit() {
    super.onInit();
    menuData.value = getFacultyMenu();
    print('Menu items: ${menuData.length}'); // Debug print
  }

}