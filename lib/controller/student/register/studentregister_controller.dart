import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:get/get.dart';

import 'package:flutter_flavors/core/local_database/dao/branchdao.dart';
import 'package:flutter_flavors/core/local_database/entity/branch_entity.dart';

class StudentRegisterController extends GetxController {
  final StudentDao studentDao = Get.find();
  final BranchDao branchDao = Get.find();

  // Form fields
  var name = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var contactNo = ''.obs;

  // Branch handling
  var branches = <BranchEntity>[].obs;
  var selectedBranch = Rxn<BranchEntity>(null);

  // Validation
  var nameError = Rx<String?>(null);
  var usernameError = Rx<String?>(null);
  var passwordError = Rx<String?>(null);
  var contactNoError = Rx<String?>(null);
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadBranches();
  }

  Future<void> loadBranches() async {
    final allBranches = await branchDao.getAllBranches();
    branches.assignAll(allBranches);
  }

  void clearFields() {
    name.value = '';
    username.value = '';
    password.value = '';
    contactNo.value = '';
    selectedBranch.value = null;
    clearErrors();
  }

  void clearErrors() {
    nameError.value = null;
    usernameError.value = null;
    passwordError.value = null;
    contactNoError.value = null;
  }

  bool validateFields() {
    clearErrors();
    var isValid = true;

    if (name.value.isEmpty) {
      nameError.value = 'Name is required';
      isValid = false;
    }

    if (username.value.isEmpty) {
      usernameError.value = 'Username is required';
      isValid = false;
    } else if (username.value.length < 4) {
      usernameError.value = 'Username must be at least 4 characters';
      isValid = false;
    }

    if (password.value.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else if (password.value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    }

    if (contactNo.value.isEmpty) {
      contactNoError.value = 'Contact number is required';
      isValid = false;
    } else if (!GetUtils.isPhoneNumber(contactNo.value)) {
      contactNoError.value = 'Enter a valid phone number';
      isValid = false;
    }

    if (selectedBranch.value == null) {
      Get.snackbar('Error', 'Please select a branch');
      isValid = false;
    }

    return isValid;
  }

  StudentEntity createStudent() {
    if (selectedBranch.value == null) {
      throw Exception("Branch must be selected before creating a student.");
    }

    return StudentEntity(
      name: name.value,
      username: username.value,
      password: password.value,
      contactNo: contactNo.value,
      branchId: selectedBranch.value!.id!, // Now it's guaranteed to be non-null
    );
  }

  Future<void> submitForm() async {
    if (validateFields()) {
      try {
        isLoading(true);
        final student = createStudent();

        final existing = await studentDao.findStudentByUsername(
          student.username,
        );
        if (existing != null) {
          Get.snackbar('Error', 'Username already exists');
          return;
        }

        await studentDao.insertStudent(student);
        Get.snackbar('Success', 'Student added successfully');
        clearFields();
      } catch (e) {
        Get.snackbar('Error', 'Failed to add student: ${e.toString()}');
      } finally {
        isLoading(false);
      }
    }
  }
}
