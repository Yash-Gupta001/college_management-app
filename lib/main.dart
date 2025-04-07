import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:flutter_flavors/ui/view/app.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase
    .databaseBuilder('app_database.db')
    .addCallback(Callback(
      onCreate: (database, version) async {
        await database.execute(
            "INSERT INTO branch_entity (id, name) VALUES (1, 'CSE')");
        await database.execute(
            "INSERT INTO branch_entity (id, name) VALUES (2, 'CIVIL')");
        await database.execute(
            "INSERT INTO branch_entity (id, name) VALUES (3, 'MECHANICAL')");
        await database.execute(
            "INSERT INTO branch_entity (id, name) VALUES (4, 'ELECTRONICS')");
      },
    ))
    .build();
  Get.put<AppDatabase>(database);
  Stripe.publishableKey = 'pk_test_51R7tZbD6D3fE5PpDtDiuQPc4pYRN0hmHrngWydB9HVdVxW8sVxtzkEQ0lC7XxJ6O1hUYSCYoVk72TzVyRVvxMjfg00sehiDY20';
  runApp(const MyApp());
}
