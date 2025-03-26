import 'package:flutter/material.dart';
import 'package:flutter_flavors/local_database/database/app_database.dart';
import 'package:flutter_flavors/view/app.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  
  Get.put<AppDatabase>(database);
  runApp(const MyApp());
}
