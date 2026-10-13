import 'dart:ui';

import 'package:agro_finder_project/presentation/farmer/login_one_screen/controller/login_one_controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppWidget {
  AppStyle as = AppStyle();
  LoginOneController controller = Get.put(LoginOneController());

  Widget EmailTextField(bool check, TextEditingController email, String label) {
    return Container(
      height: 65,
      width: 340,

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.color5),
        color: AppColors.color5,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        onChanged: (value) {
          controller.checke.value = controller.isValidEmail(value);
        },
        controller: email,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          labelText: label,
          border: InputBorder.none,
          labelStyle: as.textStyle4(),
          suffixIcon: Visibility(visible: check, child: Icon(Icons.check)),

          suffixIconColor: Color.fromRGBO(0, 255, 80, 1),
        ),
      ),
    );
  }

  Widget PasswordTextField(
    bool check,
    TextEditingController password,
    String label,
  ) {
    return Container(
      height: 65,
      width: 340,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.color5,
        border: Border.all(color: AppColors.color5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        obscureText: controller.checkp.value,
        decoration: InputDecoration(
          counterStyle: as.textStyle6(),
          suffixIcon:
              IconButton(
                    onPressed: () {
                      controller.checkp.value = !controller.checkp.value;
                    },
                    icon: (controller.checkp.value)?Icon(Icons.visibility):Icon(Icons.visibility_off),
                  ),
          // suffixIconColor: Color.fromRGBO(0, 255, 80, 1),
          filled: true,
          fillColor: Colors.transparent,
          labelText: label,
          border: InputBorder.none,
          labelStyle: as.textStyle4(),
        ),
      ),
    );
  }
}
