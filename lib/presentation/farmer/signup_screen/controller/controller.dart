import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var mobile = ''.obs;
  var address = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  var check = false.obs;

  var isValid = {
    'firstName': false.obs,
    'lastName': false.obs,
    'email': false.obs,
    'mobile': false.obs,
    'address': false.obs,
    'password': false.obs,
    'confirmPassword': false.obs,
  };

  void validate(String key, String value) {
    switch (key) {
      case 'email':
        isValid[key]!.value = GetUtils.isEmail(value);
        break;
      case 'mobile':
        isValid[key]!.value = value.length == 10;
        break;
      case 'password':
        isValid[key]!.value = value.length >= 6;
        break;
      case 'confirmPassword':
        isValid[key]!.value = value == password.value;
        break;
      default:
        isValid[key]!.value = value.isNotEmpty;
    }
  }
}
