
import 'package:agro_finder_project/presentation/farmer/activity_one_screen/model/model.dart';
import 'package:agro_finder_project/presentation/farmer/activity_one_screen/widget/widget.dart';
import 'package:agro_finder_project/presentation/labour/activity_screens/widget/widget.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';

class ActivityOneScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivityOneScreenState();
  }
}

class _ActivityOneScreenState extends State {
  AppStyle as = AppStyle();
  List cardNotCompeted = [
    Activity_Model(
      title: "Harvesting",
      isCompete: false,
      subTitle: 'Post harvest management',
    ),
    Activity_Model(
      title: "Fertilize",
      isCompete: false,
      subTitle: 'Agronomic fertilizer',
    ),
    Activity_Model(
      title: "Fertilize",
      isCompete: false,
      subTitle: 'Agronomic fertilizer',
    ),
    Activity_Model(
      title: "Harvesting",
      isCompete: false,
      subTitle: 'Post harvest management',
    ),
  ];

  List cardCompeted = [
    Activity_Model(
      title: "Harvesting",
      isCompete: true,
      subTitle: 'Post harvest management',
    ),
    Activity_Model(
      title: "Fertilize",
      isCompete: true,
      subTitle: 'Agronomic fertilizer',
    ),
    Activity_Model(
      title: "Fertilize",
      isCompete: true,
      subTitle: 'Agronomic fertilizer',
    ),
    Activity_Model(
      title: "Harvesting",
      isCompete: true,
      subTitle: 'Post harvest management',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(backgroundColor: AppColors.color3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.color3,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text("Activity", style: as.textStyle10()),
            ),
        
            SizedBox(height: 10),
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.color3,
              ),
              child: Text("Recent Activity",style: as.textStyle15()),
            ),
            SizedBox(height: 20),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: cardNotCompeted.length,
                padding: EdgeInsets.all(20),
                
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Activity_widget().activityCard(cardNotCompeted[i]),
                      SizedBox(height: 10,)
                    ],
                  );
                },
              ),
            ),
        
            Container(
              height: 60,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.color3,
              ),
              child: Text("Previous Activity",style: as.textStyle15(),),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: cardCompeted.length,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Activity_widget().activityCard(cardCompeted[i]),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
