import 'package:flutter_flavors/controller/admin/login/adminlogin_controller.dart';
import 'package:get/get.dart';

class AdminloginBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the AdminScreenController
    Get.lazyPut<AdminLoginController>(() => AdminLoginController());
  }
}
