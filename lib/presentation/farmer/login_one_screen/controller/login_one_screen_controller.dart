import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/presentation/farmer/otp_screen/otp_screens.dart';
import 'package:agro_finder_project/presentation/farmer/signup_screen/signup_screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_screen/controller/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_one_screen_controller extends GetxController {
  final AuthController _authController = Get.find<AuthController>();
  final ServiceController _serviceController = Get.find<ServiceController>();
  final RxBool isLoading = false.obs;
  final RxBool checke = false.obs;
  final RxBool checkp = false.obs;
  final RxBool isEmailLogin = true.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString phoneNumber = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print(
      'LoginOneScreen initialized with user type: ${_serviceController.currentUserType}',
    ); // Debug print
    if (_serviceController.currentUserType.isEmpty) {
      Get.back();
    }
  }

  @override
  void onClose() {
    // Clear any sensitive data
    email.value = '';
    password.value = '';
    phoneNumber.value = '';
    super.onClose();
  }

  void toggleLoginMethod() {
    isEmailLogin.value = !isEmailLogin.value;
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      if (isEmailLogin.value) {
        if (email.value.isEmpty || password.value.isEmpty) {
          Get.snackbar(
            'Error',
            'Please fill in all fields',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }
        print('Attempting email login...'); // Debug print
        await _authController.loginWithEmail(email.value, password.value);
        print(
          'Email login successful, handling login success...',
        ); // Debug print

        // Schedule the navigation for the next frame to ensure it happens before controller deletion
        Future.microtask(() {
          _serviceController.handleLoginSuccess();
        });
      } else {
        if (phoneNumber.value.isEmpty) {
          Get.snackbar(
            'Error',
            'Please enter your phone number',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }
        print('Attempting OTP login...'); // Debug print
        await _authController.sendOtp(phoneNumber.value);
        Get.to(
          () => OTPVerificationPage(
            filename: "login",
            varificationId: _authController.verificationId.value,
          ),
        );
      }
    } catch (e) {
      print('Login error: $e'); // Debug print
      Get.snackbar(
        'Error',
        'Login failed: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToSignup() {
    Get.to(() => SignupScreen());
  }
}
