import 'package:flutter_flavors/controller/student/studentscreen_binding.dart';
import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/view/student/studenthomescreen.dart';
import 'package:get/get.dart';

class StudentloginController extends GetxController{
  final StudentDao studentDao = Get.find();
  
  var insert_username = ''.obs;
  var insert_password = ''.obs;
  var isLoading = false.obs;

  Future<void> validate() async {
    try {
      isLoading(true);
      
      // Check if fields are empty
      if (insert_username.isEmpty || insert_password.isEmpty) {
        throw Exception('Please enter both username and password');
      }

      // Check credentials against database
      final faculty = await studentDao.findStudentByUsernameAndPassword(
        insert_username.value,
        insert_password.value,
      );

      if (faculty != null) {
        Get.to(
          () => StudentHomeScreen(),
          binding: StudentScreenBinding(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300),
        );
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } finally {
      isLoading(false);
    }
  }

  void clearFields() {
    insert_username.value = "";
    insert_password.value = "";
  }
}