import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:get/get.dart';

class GetallStudentsController extends GetxController {
  final StudentDao studentDao;
  final BranchDao branchDao;

  GetallStudentsController(this.studentDao, this.branchDao);
  
  var students = <StudentEntity>[].obs;
  var branchNames = <int, String>{}.obs; // Map to store branch names by ID

  @override
  void onReady() {
    fetchAllStudents();
    super.onReady();
  }

  Future<void> fetchAllStudents() async {
    try {
      final studentList = await studentDao.findAllStudents();
      students.assignAll(studentList);

      // Fetch branch names for each student
      for (var student in studentList) {
        if (!branchNames.containsKey(student.branchId)) {
          final branch = await branchDao.getBranchById(student.branchId);
          branchNames[student.branchId] = branch?.name ?? "Unknown";
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch students: ${e.toString()}');
    }
  }
}
