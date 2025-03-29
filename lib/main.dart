import 'package:flutter/material.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:flutter_flavors/view/app.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  
  Get.put<AppDatabase>(database);
  Stripe.publishableKey = 'pk_test_51R7tZbD6D3fE5PpDtDiuQPc4pYRN0hmHrngWydB9HVdVxW8sVxtzkEQ0lC7XxJ6O1hUYSCYoVk72TzVyRVvxMjfg00sehiDY20';
  runApp(const MyApp());
}
