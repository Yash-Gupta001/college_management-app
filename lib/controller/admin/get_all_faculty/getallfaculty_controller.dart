import 'package:flutter_flavors/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/local_database/entity/faculty_entity.dart';
import 'package:get/get.dart';

class GetallFacultyController extends GetxController {
  final FacultyDao facultyDao;
  var teachers = <FacultyEntity>[].obs;

  GetallFacultyController(this.facultyDao); // Proper constructor injection

  @override
  void onReady() {
    fetchAllFaculty();
    super.onReady();
  }

  Future<void> fetchAllFaculty() async {
    try {
      final facultyList = await facultyDao.findAllFaculties();
      teachers.assignAll(facultyList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch faculty: ${e.toString()}');
    }
  }
}