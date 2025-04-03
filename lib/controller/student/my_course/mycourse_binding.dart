import 'package:flutter_flavors/controller/admin/get_all_subjects/getallsubjects_controller.dart';
import 'package:flutter_flavors/controller/student/my_course/mycourse_controller.dart';
import 'package:flutter_flavors/core/local_database/database/app_database.dart';
import 'package:get/get.dart';

class MyCourseBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MyCourseController>(() => MyCourseController());

    final database = Get.find<AppDatabase>();

    // Lazy load GetAllSubjectsController with both SubjectDao and BranchDao
    Get.lazyPut<GetAllSubjectsController>(
      () => GetAllSubjectsController(database.subjectDao, database.branchdao),
    );
    
  }
  
}