import 'package:agro_finder_project/presentation/farmer/filter_screen/filter_screen.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

AppStyle as = AppStyle();
Widget serviceprocard(String img, String title) {
  return GestureDetector(
    onTap: () {
      Get.to(FilterScreen());
    },
    child: Container(
      height: 89,
      width: 350,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: AppColors.color3,
      ),
      child: Row(
        children: [
          Image.asset(img, height: 78, width: 103),
          Container(
            height: 55,
            width: 207,
            alignment: Alignment.center,
            child: Text(title, style: as.textStyle11()),
          ),
        ],
      ),
    ),
  );
}
