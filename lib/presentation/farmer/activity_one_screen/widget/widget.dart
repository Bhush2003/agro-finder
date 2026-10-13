import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';

AppStyle as = AppStyle();

class ActivityWidget {
  Widget buildActivityCard(dynamic model) {
    return Container(
      height: 100,
      width: 350,
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
    );
  }
}
