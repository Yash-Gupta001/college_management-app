import 'package:flutter_flavors/local_database/dao/subjectdao.dart';
import 'package:flutter_flavors/local_database/entity/subject_entity.dart';
import 'package:get/get.dart';

class GetAllSubjectsController extends GetxController{
  final SubjectDao subjectDao;
  var subjects = <SubjectEntity>[].obs;

  GetAllSubjectsController(this.subjectDao);

  // Method to insert a subject and update the list
  Future<void> insertSubject(SubjectEntity subject) async {
    await subjectDao.insertSubject(subject);
    _loadSubjects(); // Reload the subjects after adding one
  }

  // Method to delete a subject and update the list
  Future<void> deleteSubject(SubjectEntity subject) async {
    await subjectDao.deleteSubject(subject);
    _loadSubjects(); // Reload the subjects after adding one
  }

  // Method to load all subjects from the database
  Future<void> _loadSubjects() async {
    final fetchedSubjects = await subjectDao.getAllSubjects();
    subjects.value = fetchedSubjects; // Update the observable list
  }


  @override
  void onInit() {
    super.onInit();
    _loadSubjects();
  }
}