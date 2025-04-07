import 'package:flutter_flavors/ui/controller/student/studentscreen_binding.dart';
import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/ui/view/student/studenthomescreen.dart';
import 'package:get/get.dart';

class StudentloginController extends GetxController {
  final StudentDao studentDao = Get.find();

  var insert_username = ''.obs;
  var insert_password = ''.obs;
  var isLoading = false.obs;

  Future<void> validate() async {
    try {
      isLoading(true);

      if (insert_username.isEmpty || insert_password.isEmpty) {
        throw Exception('Please enter both username and password');
      }

      final student = await studentDao.findStudentByUsernameAndPassword(
        insert_username.value,
        insert_password.value,
      );

      if (student != null) {
        // Store username globally
        Get.put<String>(student.username, tag: 'currentStudentUsername');

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
      );
    } finally {
      isLoading(false);
    }
  }
}
