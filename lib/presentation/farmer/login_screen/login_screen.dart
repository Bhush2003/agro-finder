import 'package:agro_finder_project/presentation/farmer/login_screen/controller/login_screen_controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late final Login_screen_controller controller;
  AppStyle as = AppStyle();

  @override
  void initState() {
    super.initState();
    controller = Get.put(Login_screen_controller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4, // Deep green shade
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/loginPage/Group 2.png",
              width: 200,
              height: 200,
              scale: 1.2,
            ),
            SizedBox(height: 20),
            Text(TranslationKeys.appName.tr, style: as.textStyle1()),
            SizedBox(height: 10),
            Text(TranslationKeys.chooseLanguage.tr, style: as.textStyle2()),
            SizedBox(height: 20),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.SelectLanguage(TranslationKeys.english.tr);
                },
                child: Container(
                  height: 66,
                  width: 226,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        controller.selectedLanguage.value ==
                                TranslationKeys.english.tr
                            ? AppColors.color3
                            : Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    TranslationKeys.english.tr,
                    style: as.textStyle3(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.SelectLanguage(TranslationKeys.marathi.tr);
                },
                child: Container(
                  height: 66,
                  width: 226,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        controller.selectedLanguage.value ==
                                TranslationKeys.marathi.tr
                            ? AppColors.color3
                            : Colors.white,
                  ),
                  child: Text(
                    TranslationKeys.marathi.tr,
                    style: as.textStyle3(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.SelectLanguage(TranslationKeys.hindi.tr);
                },
                child: Container(
                  height: 66,
                  width: 226,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        controller.selectedLanguage.value ==
                                TranslationKeys.hindi.tr
                            ? AppColors.color3
                            : Colors.white,
                  ),
                  child: Text(TranslationKeys.hindi.tr, style: as.textStyle3()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
