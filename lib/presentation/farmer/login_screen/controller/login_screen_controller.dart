import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/presentation/farmer/login_one_screen/login_One_Screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_screen/service_screen.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_screen_controller extends GetxController {
  final AuthController _authController = Get.find<AuthController>();
  final RxString selectedLanguage = TranslationKeys.english.tr.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('language');
      if (savedLanguage != null) {
        selectedLanguage.value = savedLanguage;
        updateLocale(savedLanguage);
      }
    } catch (e) {
      print('Error loading saved language: $e');
    }
  }

  void updateLocale(String language) {
    switch (language) {
      case 'English':
        Get.updateLocale(const Locale('en', 'US'));
        break;
      case 'मराठी':
        Get.updateLocale(const Locale('mr', 'IN'));
        break;
      case 'हिंदी':
        Get.updateLocale(const Locale('hi', 'IN'));
        break;
    }
  }

  Future<void> SelectLanguage(String language) async {
    try {
      selectedLanguage.value = language;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', language);

      // Update the locale immediately
      updateLocale(language);

      // Show success message
      Get.snackbar(
        TranslationKeys.success.tr,
        TranslationKeys.languageChanged.tr.replaceAll('@language', language),
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to login screen after language selection
      Get.to(ServiceScreen());
    } catch (e) {
      print('Error saving language: $e');
      Get.snackbar(
        TranslationKeys.error.tr,
        'Failed to change language',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Handle mobile number login
  Future<void> handleMobileLogin(String phoneNumber) async {
    try {
      await _authController.sendOtp(phoneNumber);
    } catch (e) {
      print('Error in mobile login: $e');
    }
  }

  // Handle email login
  Future<void> handleEmailLogin(String email, String password) async {
    try {
      await _authController.loginWithEmail(email, password);
    } catch (e) {
      print('Error in email login: $e');
    }
  }

  // Handle OTP verification
  Future<void> handleOtpVerification(String otp) async {
    try {
      await _authController.verifyOtp(otp);
    } catch (e) {
      print('Error in OTP verification: $e');
    }
  }
}
