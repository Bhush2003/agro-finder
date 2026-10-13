import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var password = ''.obs;
  var confirmPassword = ''.obs;

  bool get isPasswordValid => password.value.length >= 6;
  bool get isConfirmPasswordValid =>
      confirmPassword.value == password.value && isPasswordValid;
}
