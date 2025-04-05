import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:flutter_flavors/core/local_database/entity/subject_entity.dart';
import 'package:get/get.dart';

class GetallStudentsController extends GetxController {
  final StudentDao studentDao;
  final BranchDao branchDao;
  final SubjectDao subjectDao;

  GetallStudentsController(this.studentDao, this.branchDao, this.subjectDao);

  var subjects = <SubjectEntity>[].obs;
  var students = <StudentEntity>[].obs;
  var branches = <BranchEntity>[].obs;
  var branchNames = <int, String>{}.obs;

  @override
  void onReady() {
    super.onReady();
    fetchAllStudents();
    _loadSubjects();
    _loadBranches();
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

  Future<void> _loadSubjects() async {
    final fetchedSubjects = await subjectDao.getAllSubjects();
    subjects.value = fetchedSubjects;
  }

  Future<void> _loadBranches() async {
    final fetchedBranches = await branchDao.getAllBranches();
    branches.value = fetchedBranches;
  }

  // Returns subject name with branch name
  List<Map<String, String>> get subjectsWithBranch {
    final branchMap = {for (var b in branches) b.id!: b.name};

    return subjects.map((subject) {
      return {
        'subject': subject.name,
        'branch': branchMap[subject.branchId] ?? 'Unknown',
      };
    }).toList();
  }

  // Returns subject name with branch name only for current student's branch
  List<Map<String, String>> get subjectsWithBranchfiltered {
    if (students.isEmpty || branches.isEmpty || subjects.isEmpty) {
      return [];
    }

    final currentUsername = Get.find<String>(tag: 'currentStudentUsername');

    final student = students.firstWhere(
      (s) => s.username == currentUsername,
      // orElse: () => students.first, // fallback if something goes wrong
    );

    final branchMap = {for (var b in branches) b.id!: b.name};

    final filteredSubjects = subjects.where(
      (s) => s.branchId == student.branchId,
    );

    return filteredSubjects.map((subject) {
      return {
        'subject': subject.name,
        'branch': branchMap[subject.branchId] ?? 'Unknown',
      };
    }).toList();
  }
}
