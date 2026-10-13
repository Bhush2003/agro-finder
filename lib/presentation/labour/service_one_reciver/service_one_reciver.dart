import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:agro_finder_project/presentation/labour/service_reciver/widget/widget.dart';
import 'package:agro_finder_project/presentation/labour/service_three_reciver/service_three_reciver.dart';
import 'package:agro_finder_project/presentation/labour/service_two_reciver/service_two_reciver.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  _AddGroupScreenState createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final LabourController controller = Get.put(LabourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      
      appBar: AppBar(
        backgroundColor: AppColors.color3,
        title: Text(
          'Add Agricultural Labour’s',
          style: TextStyle(color: AppColors.color6),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu, color: AppColors.color6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => Get.to(() => CreateGroupScreen()),
              icon: Icon(Icons.add),
              label: Text("Add Groups"),
              style: buttonStyle(),
            ),
            SizedBox(height: 10),
            Obx(
              () => Column(
                children:
                    controller.groups
                        .map(
                          (group) => Column(
                            children: [
                              ElevatedButton(
                                onPressed:
                                    () => Get.to(
                                      () => GroupDetailScreen(groupName: group),
                                    ),
                                child: Text(group),
                                style: buttonStyle(),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ).toList(),
                        
              ),
            ),
          ],
        ),
      ),
    );
  }
}
