import 'package:flutter_flavors/core/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';

class MyCourseController extends GetxController {
  final BranchDao branchDao;
  final SubjectDao subjectDao;

  var subjects = <SubjectEntity>[].obs;
  var studentBranchId = Rxn<int>(); // Using Rxn<int> to handle null safety

  MyCourseController(this.branchDao, this.subjectDao);

  void setStudentBranch(int branchId) {
    studentBranchId.value = branchId;
    loadSubjectsForBranch(); // Load subjects immediately
  }

  @override
  void onReady() {
    super.onReady();
    if (studentBranchId.value != null) {
      loadSubjectsForBranch(); // Ensure subjects load on controller ready
    }
  }

  Future<void> loadSubjectsForBranch() async {
    if (studentBranchId.value == null || studentBranchId.value == 0) {
      print("Invalid branch ID, skipping subject load.");
      return;
    }

    print("Fetching subjects for branch ID: ${studentBranchId.value}");
    final fetchedSubjects = await subjectDao.getAllSubjects();

    subjects.assignAll(fetchedSubjects
        .where((subject) => subject.branchId == studentBranchId.value)
        .toList());

    print("Found ${subjects.length} subjects for branch ID: ${studentBranchId.value}");
  }
}
