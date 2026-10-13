import 'package:agro_finder_project/presentation/farmer/activity_one_screen/model/model.dart';
import 'package:agro_finder_project/presentation/labour/activity_screens/model/model.dart';
import 'package:agro_finder_project/presentation/labour/otp_screen/otp_screen.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';

class Activity_widget {
  AppStyle as = AppStyle();

  Widget activityCard(dynamic model) {
    if (model is! Activity_Model && model is! Activity_Labour_Model) {
      throw Exception('Invalid model type passed to activityCard');
    }

    return InkWell(
      onTap: () {
        if (!model.isCompete) {
          Get.to(OtpConfirmationScreen());
        }
      },
      child: Container(
        height: 80,
        width: 399,
        decoration: BoxDecoration(
          color: AppColors.color2,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (model.isCompete)
                ? Container(
                  height: 58,
                  width: 58,
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: AppColors.color1),
                  ),
                )
                : Container(height: 55, width: 55),
            Container(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(model.title, style: as.textStyle13()),
                  SizedBox(height: 4),
                  Text(model.subTitle, style: as.textStyle6()),
                ],
              ),
            ),
            (!model.isCompete)
                ? Container(
                  child: Text("On Going", style: as.textStyle14()),
                  decoration: BoxDecoration(color: AppColors.color3),
                )
                : Container(
                  child: Text("Complete", style: as.textStyle14()),
                  decoration: BoxDecoration(color: Colors.green),
                ),
          ],
        ),
      ),
    );
  }
}
