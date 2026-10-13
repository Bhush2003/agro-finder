import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/presentation/farmer/bottom_sheet/bottom_sheet.dart';
import 'package:agro_finder_project/presentation/farmer/reset_password_screen/reset_password_screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_screen/controller/service_controller.dart';
import 'package:agro_finder_project/presentation/labour/service_reciver/service_reciver.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class Otp_screen_controller extends GetxController {
  final AuthController _authController = Get.find<AuthController>();
  final ServiceController _serviceController = Get.find<ServiceController>();
  final RxBool isLoading = false.obs;
  final RxList<String> otpDigits = List.generate(6, (_) => '').obs;
  final RxBool isOtpValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Clear any existing OTP when screen loads
    clearOtp();
    // Wait for verification ID to be loaded
    _waitForVerificationId();
  }

  @override
  void onClose() {
    // Clear OTP data
    clearOtp();
    super.onClose();
  }

  Future<void> _waitForVerificationId() async {
    int attempts = 0;
    while (_authController.verificationId.value.isEmpty && attempts < 10) {
      await Future.delayed(const Duration(milliseconds: 500));
      attempts++;
      print('Waiting for verification ID... Attempt $attempts');
    }

    if (_authController.verificationId.value.isEmpty) {
      print('Verification ID not found after $attempts attempts');
      Get.snackbar(
        'Error',
        'Verification ID not found. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      print('Verification ID loaded: ${_authController.verificationId.value}');
    }
  }

  void updateOTP(int index, String value) {
    if (value.isNotEmpty) {
      otpDigits[index] = value;
      print('Updated OTP at index $index: $value');
      print('Current OTP: ${getOtp()}');
      if (index < 5) {
        // Move to next field
        Get.focusScope?.nextFocus();
      }
    }
  }

  void handleBackspace(int index) {
    if (index > 0) {
      otpDigits[index] = '';
      print('Cleared OTP at index $index');
      print('Current OTP: ${getOtp()}');
      Get.focusScope?.previousFocus();
    }
  }

  void clearOtp() {
    for (int i = 0; i < otpDigits.length; i++) {
      otpDigits[i] = '';
    }
    print('Cleared all OTP digits');
  }

  String getOtp() {
    String otp = otpDigits.join();
    print('Getting OTP: $otp');
    return otp;
  }

  bool validateOtp() {
    bool isValid = otpDigits.every((digit) => digit.isNotEmpty);
    print('Validating OTP: ${getOtp()} - Is valid: $isValid');
    return isValid;
  }

  Future<void> verifyOtp() async {
    try {
      if (!validateOtp()) {
        Get.snackbar(
          'Error',
          'Please enter complete OTP',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      if (_authController.verificationId.value.isEmpty) {
        print('Verification ID is empty, waiting for it...');
        await _waitForVerificationId();
        if (_authController.verificationId.value.isEmpty) {
          throw Exception('Verification ID not available');
        }
      }

      isLoading.value = true;
      String otp = getOtp();
      print('Verifying OTP: $otp');
      print('Verification ID: ${_authController.verificationId.value}');

      await _authController.verifyOtp(otp);

      // Schedule the navigation for the next frame
      Future.microtask(() {
        _serviceController.handleLoginSuccess();
      });
    } catch (e) {
      print('OTP verification error: $e');
      Get.snackbar(
        'Error',
        'Failed to verify OTP. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp() async {
    try {
      isLoading.value = true;
      print('Resending OTP to: ${_authController.phoneNumber.value}');
      await _authController.sendOtp(_authController.phoneNumber.value);
      Get.snackbar(
        'Success',
        'OTP resent successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Resend OTP error: $e');
      Get.snackbar(
        'Error',
        'Failed to resend OTP. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
