import 'package:flutter_flavors/ui/controller/admin/adminscreen_binding.dart';
import 'package:flutter_flavors/ui/view/admin/adminhomescreen.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  String username = "admin123";
  String password = "admin123";

  RxString insert_adminname = "".obs;
  RxString insert_adminpassword = "".obs;

  void Validate(){
    if(username == insert_adminname.value && password ==insert_adminpassword.value ){
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
    insert_adminname.value = "";
    insert_adminpassword.value = "";
  }
}