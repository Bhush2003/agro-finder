import 'package:agro_finder_project/presentation/farmer/login_one_screen/controller/login_one_screen_controller.dart';
import 'package:agro_finder_project/presentation/farmer/login_one_screen/widget/widgets.dart';
import 'package:agro_finder_project/presentation/farmer/otp_screen/otp_screens.dart';
import 'package:agro_finder_project/presentation/farmer/signup_screen/signup_screen.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agro_finder_project/translations/app_translations.dart';

class LoginOneScreen extends StatefulWidget {
  const LoginOneScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginOneScreenState();
  }
}

class _LoginOneScreenState extends State {
  AppStyle as = AppStyle();
  AppWidget aw = AppWidget();
  Login_one_screen_controller controller = Get.put(
    Login_one_screen_controller(),
  );
  bool checke = false;
  bool checkp = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

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
                Text(TranslationKeys.login.tr, style: as.textStyle1()),
                SizedBox(height: screenHeight * 0.01),
                Obx(
                  () =>
                      controller.isEmailLogin.value
                          ? Column(
                            children: [
                              Container(
                                height: screenHeight * 0.08,
                                width: screenWidth * 0.85,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.color5),
                                  color: AppColors.color5,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: email,
                                  onChanged:
                                      (value) => controller.email.value = value,
                                  decoration: InputDecoration(
                                    hintText: TranslationKeys.email.tr,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: AppColors.color3,
                                    ),
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
                                  controller: password,
                                  onChanged:
                                      (value) =>
                                          controller.password.value = value,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: TranslationKeys.password.tr,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: AppColors.color3,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Container(
                            height: screenHeight * 0.08,
                            width: screenWidth * 0.85,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.color5),
                              color: AppColors.color5,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: phone,
                              onChanged:
                                  (value) =>
                                      controller.phoneNumber.value = value,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: TranslationKeys.loginWithPhone.tr,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.color3,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            OTPVerificationPage(
                              filename: "forgetpassword",
                              varificationId: "",
                            ),
                          );
                        },
                        child: Text(
                          TranslationKeys.forgotPassword.tr,
                          style: as.textStyle7(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                GestureDetector(
                  onTap: () => controller.login(),
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: AppColors.color3,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      TranslationKeys.login.tr,
                      style: as.textStyle5(),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(
                  () => GestureDetector(
                    onTap: controller.toggleLoginMethod,
                    child: Text(
                      controller.isEmailLogin.value
                          ? TranslationKeys.loginWithPhone.tr
                          : TranslationKeys.loginWithEmail.tr,
                      style: TextStyle(
                        color: AppColors.color3,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.35,
                      child: Divider(height: 2, color: AppColors.color1),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(TranslationKeys.or.tr, style: as.textStyle9()),
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      width: screenWidth * 0.35,
                      child: Divider(height: 2, color: AppColors.color1),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(29),
                        right: Radius.circular(29),
                      ),
                      color: AppColors.color1,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/login_one_page/Group copy.png",
                          height: screenHeight * 0.02,
                          width: screenHeight * 0.02,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          TranslationKeys.continueWithGoogle.tr,
                          style: as.textStyle8(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TranslationKeys.dontHaveAccount.tr,
                      style: as.textStyle9(),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignupScreen());
                      },
                      child: Text(
                        TranslationKeys.signUp.tr,
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
