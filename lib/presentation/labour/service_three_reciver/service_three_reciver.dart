import 'package:agro_finder_project/presentation/labour/service_five_reciver/service_five_reciver.dart';
import 'package:agro_finder_project/presentation/labour/service_four_reciver/service_four_screen.dart';
import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GroupDetailScreen extends StatefulWidget {
  final String groupName;
  GroupDetailScreen({required this.groupName});

  @override
  _GroupDetailScreenState createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  final LabourController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        backgroundColor: AppColors.color3,
        title: Text(widget.groupName, style: TextStyle(color: Colors.black)),
        leading: BackButton(color: AppColors.color6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Group Leaders Name"),
                  Text(controller.name.value),
                ],
              ),
              style: _buttonStyle(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.to(() => AddLabourScreen()),
              child: Text("Add Labours"),
              style: _buttonStyle(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("Labours Names"),
              style: _buttonStyle(),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.labours.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.color5,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('${index + 1}. ${controller.labours[index]}'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() => ElevatedButton.styleFrom(
    backgroundColor: AppColors.color3,
    foregroundColor: AppColors.color6,
    minimumSize: Size(double.infinity, 50),
  );
}
