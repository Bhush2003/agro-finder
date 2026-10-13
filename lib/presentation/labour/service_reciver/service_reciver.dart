import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:agro_finder_project/presentation/labour/service_reciver/model/model.dart';
import 'package:agro_finder_project/presentation/labour/service_reciver/widget/widget.dart';
import 'package:agro_finder_project/presentation/labour/service_three_reciver/service_three_reciver.dart';
import 'package:agro_finder_project/presentation/labour/service_two_reciver/service_two_reciver.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGroupScreen extends StatefulWidget {
  @override
  _AddGroupScreenState createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final LabourController controller = Get.put(LabourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.color4,
      bottomNavigationBar: BottomNavigationBar(
      onTap: (value) {
        controller.currentIndex.value = value;
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: controller.currentIndex.value,
      backgroundColor: AppColors.color3,
      selectedItemColor: AppColors.color6,
      unselectedItemColor: AppColors.color6,
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Activity'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
      body: Obx(()=>labourscreen[controller.currentIndex.value],)
    );
  }

  
}
