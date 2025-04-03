import 'package:flutter_flavors/controller/profile_page/profilescreen_controller.dart';
import 'package:get/get.dart';

class ProfilescreenBinding extends Bindings{
  @override
  void dependencies() {
    // Bind the StudentScreenController
    Get.lazyPut<ProfilescreenController>(() => ProfilescreenController());
  }
}