import 'package:flutter_flavors/controller/admin/adminscreen_binding.dart';
import 'package:flutter_flavors/view/admin/adminhomescreen.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  String username = "admin123";
  String password = "admin123";

  RxString insert_username = "".obs;
  RxString insert_password = "".obs;

  void Validate(){
    if(username == insert_username.value && password ==insert_password.value ){
      Get.to(
        () => AdminHomeScreen(),
        binding: AdminScreenBinding(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
      );
    } else {
      Get.snackbar(
        "Invalid Credentials",
        "Please check your username and password",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  void clearFields() {
    insert_username.value = "";
    insert_password.value = "";
  }
}