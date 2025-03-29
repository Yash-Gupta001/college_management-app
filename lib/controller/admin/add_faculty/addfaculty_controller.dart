import 'package:flutter_flavors/core/local_database/dao/facultydao.dart';
import 'package:flutter_flavors/core/local_database/entity/faculty_entity.dart';
import 'package:get/get.dart';

class AddFacultyController extends GetxController {
  final FacultyDao facultyDao = Get.find(); // Get the DAO instance
  
  // Form field observables
  var name = ''.obs;
  var lastname = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var email = ''.obs;
  var salary = 0.0.obs;
  var contactNo = ''.obs;
  var subject = ''.obs;
  
  // Validation observables
  var nameError = Rx<String?>(null);
  var lastnameError = Rx<String?>(null);
  var usernameError = Rx<String?>(null);
  var passwordError = Rx<String?>(null);
  var emailError = Rx<String?>(null);
  var salaryError = Rx<String?>(null);
  var contactNoError = Rx<String?>(null);
  var subjectError = Rx<String?>(null);

  // Loading state
  var isLoading = false.obs;

  // Clear all fields
  void clearFields() {
    name.value = '';
    lastname.value = '';
    username.value = '';
    password.value = '';
    email.value = '';
    salary.value = 0.0;
    contactNo.value = '';
    subject.value = '';
    clearErrors();
  }

  // Clear all validation errors
  void clearErrors() {
    nameError.value = null;
    lastnameError.value = null;
    usernameError.value = null;
    passwordError.value = null;
    emailError.value = null;
    salaryError.value = null;
    contactNoError.value = null;
    subjectError.value = null;
    }

  // Validate all fields
  bool validateFields() {
    clearErrors();
    
    var isValid = true;
    
    if (name.value.isEmpty) {
      nameError.value = 'Name is required';
      isValid = false;
    }
    
    if (lastname.value.isEmpty) {
      lastnameError.value = 'Last name is required';
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
    
    if (email.value.isEmpty) {
      emailError.value = 'Email is required';
      isValid = false;
    } else if (!GetUtils.isEmail(email.value)) {
      emailError.value = 'Enter a valid email';
      isValid = false;
    }
    
    if (salary.value <= 0) {
      salaryError.value = 'Salary must be greater than 0';
      isValid = false;
    }
    
    if (contactNo.value.isEmpty) {
      contactNoError.value = 'Contact number is required';
      isValid = false;
    } else if (!GetUtils.isPhoneNumber(contactNo.value)) {
      contactNoError.value = 'Enter a valid phone number';
      isValid = false;
    }

    if (subject.value.isEmpty) {
      subjectError.value = 'Subject is required';
      isValid = false;
    }
    
    return isValid;
  }

  // Create FacultyEntity from current field values
  FacultyEntity createFaculty() {
    return FacultyEntity(
      name: name.value,
      lastname: lastname.value,
      username: username.value,
      password: password.value,
      email: email.value,
      salary: salary.value,
      contactNo: contactNo.value, 
      subject: subject.value,
    );
  }

  // Submit form
  Future<void> submitForm() async {
    if (validateFields()) {
      try {
        isLoading(true);
        final faculty = createFaculty();
        
        // Check if username already exists
        final existingFaculty = await facultyDao.findFacultyByUsername(faculty.username);
        if (existingFaculty != null) {
          Get.snackbar('Error', 'Username already exists');
          return;
        }
        
        // Insert new faculty
        await facultyDao.insertFaculty(faculty);
        Get.snackbar('Success', 'Faculty added successfully');
        clearFields();
      } catch (e) {
        Get.snackbar('Error', 'Failed to add faculty: ${e.toString()}');
      } finally {
        isLoading(false);
        clearFields();
      }
    } else {
      Get.snackbar('Error', 'Please fix the errors in the form');
    }
  }
}