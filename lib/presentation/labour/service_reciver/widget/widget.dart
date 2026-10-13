
import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final LabourController controller = Get.put(LabourController());
ButtonStyle buttonStyle() => ElevatedButton.styleFrom(
    backgroundColor: AppColors.color3,
    foregroundColor: AppColors.color6,
    minimumSize: Size(double.infinity, 50),
  );

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }