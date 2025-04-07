import 'package:flutter_flavors/core/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/entity/faculty_entity.dart';
import 'package:get/get.dart';

class GetallFacultyController extends GetxController {
  final FacultyDao facultyDao;
  final BranchDao branchdao;
  var teachers = <FacultyEntity>[].obs;
  var branchNames = <String, String>{}.obs; // Store faculty name -> branch mapping

  GetallFacultyController(this.facultyDao, this.branchdao);

  @override
  void onReady() {
    fetchAllFaculty();
    super.onReady();
  }

  Future<void> fetchAllFaculty() async {
    try {
      final facultyList = await facultyDao.findAllFaculties();
      teachers.assignAll(facultyList);

      // Fetch branch names for each faculty's subject
      for (var faculty in facultyList) {
        final branchName = await branchdao.getBranchNameBySubject(faculty.subject);
        branchNames[faculty.name] = branchName ?? "Unknown"; // Store branch name
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch faculty: ${e.toString()}');
    }
  }
}
