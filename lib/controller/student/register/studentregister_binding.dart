import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/controller/student/register/studentregister_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class StudentRegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Access the database instance and provide the SubjectDao
    final database = Get.find<AppDatabase>();

    // Bind the FacultyRegisterController
    Get.lazyPut<StudentRegisterController>(() => StudentRegisterController());

    // Lazy load AdminScreenController and pass SubjectDao as a dependency
    // Get.lazyPut<GetAllSubjectsController>(() => GetAllSubjectsController(database.subjectDao));
  }
}
