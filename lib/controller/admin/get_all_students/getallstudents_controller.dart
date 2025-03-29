import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:get/get.dart';

class GetallStudentsController extends GetxController{
  GetallStudentsController(StudentDao studentDao);
  var students = <StudentEntity>[].obs;
}