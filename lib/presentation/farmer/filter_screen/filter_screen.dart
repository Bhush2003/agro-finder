import 'package:agro_finder_project/presentation/farmer/activity_screen/activity_screen.dart';
import 'package:agro_finder_project/presentation/farmer/filter_screen/controller/filter_screen_controller.dart';
import 'package:agro_finder_project/presentation/farmer/filter_screen/widget/widget.dart';
import 'package:agro_finder_project/presentation/labour/service_provider_one_screen/service_provider_one_screen.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State {
  AppStyle as = AppStyle();
  CounterController controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        backgroundColor: AppColors.color3,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: AppColors.color1,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              child: Text("Order", style: as.textStyle10()),
            ),
            SizedBox(height: 10),
            Text("Location Services", style: as.textStyle2()),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.to(MapScreen());
              },
              child: Container(
                height: 53,
                width: 151,
                decoration: BoxDecoration(
                  color: AppColors.color1,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Text("USE GPS", style: as.textStyle12()),
              ),
            ),
            SizedBox(height: 10),
            Text("Job Date", style: as.textStyle2()),
            SizedBox(height: 10),

            CustomButton(label: "CHOOSE DATE"),

            SizedBox(height: 40),

            Container(
              decoration: BoxDecoration(
                color: AppColors.color1,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildButton(Icons.remove, controller.decrement),
                  Container(
                    color: AppColors.color1,
                    child: Obx(
                      ()=> Text(
                        controller.count.value.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  buildButton(Icons.add, controller.increment),
                ],
              ),
            ),

            Spacer(),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 53,
                  width: 151,
                  decoration: BoxDecoration(
                    color: AppColors.color1,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: Alignment.center,
                  child: Text("CANCEL", style: as.textStyle12()),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(ApplicationScreen());
                  },
                  child: Container(
                    height: 53,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.color3,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center,
                    child: Text("APPLY CHANGES", style: as.textStyle12()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
