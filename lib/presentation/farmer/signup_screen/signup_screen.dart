import 'package:agro_finder_project/auth/signup.dart';
import 'package:agro_finder_project/presentation/farmer/login_one_screen/login_One_Screen.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  AppStyle as = AppStyle();
  SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final screenHeight = size.height - padding.top - padding.bottom;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Image.asset(
                  "assets/images/loginPage/Group 2.png",
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(TranslationKeys.signup.tr, style: as.textStyle1()),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.color5),
                    color: AppColors.color5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      hintText: TranslationKeys.email.tr,
                      prefixIcon: Icon(Icons.email, color: AppColors.color3),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.color5),
                    color: AppColors.color5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: TranslationKeys.password.tr,
                      prefixIcon: Icon(Icons.lock, color: AppColors.color3),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.color5),
                    color: AppColors.color5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: TranslationKeys.phone.tr,
                      prefixIcon: Icon(Icons.phone, color: AppColors.color3),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                GestureDetector(
                  onTap: () {
                    // Handle signup
                    controller.signupwithemail();
                  },
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: AppColors.color3,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      TranslationKeys.signup.tr,
                      style: as.textStyle5(),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TranslationKeys.haveAnAccount.tr,
                      style: as.textStyle9(),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(LoginOneScreen());
                      },
                      child: Text(
                        TranslationKeys.logIn.tr,
                        style: as.textStyle6(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
