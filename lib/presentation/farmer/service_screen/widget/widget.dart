import 'package:agro_finder_project/presentation/farmer/service_screen/controller/service_controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';

AppStyle as = AppStyle();

Widget flCard(String title, ServiceController controller) {
  return GestureDetector(
    onTap: () {
      print('Selected user type: $title'); // Debug print
      controller.selectUserType(title);
    },
    child: Container(
      height: 100,
      width: 340,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.color3,
      ),
      child: Text(title, style: as.textStyle10()),
    ),
  );
}
