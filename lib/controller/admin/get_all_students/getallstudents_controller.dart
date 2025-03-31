import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:get/get.dart';

class GetallStudentsController extends GetxController{
  final StudentDao studentDao;

  GetallStudentsController(this.studentDao);
  var students = <StudentEntity>[].obs;
  
  @override
  void onReady() {
    fetchAllStudent();
    super.onReady();
  }

  Future<void> fetchAllStudent() async {
    try {
      final facultyList = await studentDao.findAllStudents();
      students.assignAll(facultyList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch faculty: ${e.toString()}');
    }
  }
}