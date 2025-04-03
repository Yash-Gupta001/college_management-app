import 'package:flutter_flavors/core/local_database/dao/studentdao.dart';
import 'package:flutter_flavors/core/local_database/entity/student_entity.dart';
import 'package:get/get.dart';

class StudentRegisterController extends GetxController {

  final StudentDao studentDao = Get.find();


  // Form field observables
  var name = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var contactNo = ''.obs;

  // Validation observables
  var nameError = Rx<String?>(null);
  var usernameError = Rx<String?>(null);
  var passwordError = Rx<String?>(null);
  var contactNoError = Rx<String?>(null);

  // Loading state
  var isLoading = false.obs;

  // Clear all fields
  void clearFields() {
    name.value = '';
    username.value = '';
    password.value = '';
    contactNo.value = '';
    clearErrors();
  }

  // Clear all validation errors
  void clearErrors() {
    nameError.value = null;
    usernameError.value = null;
    passwordError.value = null;
    contactNoError.value = null;
  }

  // Validate all fields
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

    return isValid;
  }

  // Create FacultyEntity from current field values
  StudentEntity createStudent() {
    return StudentEntity(
      name: name.value,
      username: username.value,
      password: password.value,
      contactNo: contactNo.value,
    );
  }

  // Submit form
  Future<void> submitForm() async {
    if (validateFields()) {
      try {
        isLoading(true);
        final student = createStudent();

        // Check if username already exists
        final existingFaculty = await studentDao.findStudentByUsername(
          student.username,
        );
        if (existingFaculty != null) {
          Get.snackbar('Error', 'Username already exists');
          return;
        }

        // Insert new student
        await studentDao.insertStudent(student);
        Get.snackbar('Success', 'Student added successfully');
        clearFields();
      } catch (e) {
        Get.snackbar('Error', 'Failed to add Student: ${e.toString()}');
      } finally {
        isLoading(false);
        clearFields();
      }
    } else {
      Get.snackbar('Error', 'Please fix the errors in the form');
    }
  }
}
