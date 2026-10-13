import 'package:agro_finder_project/presentation/farmer/bottom_sheet/controller/controller.dart';
import 'package:agro_finder_project/presentation/farmer/bottom_sheet/model/model.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationScreenState();
  }
}

class _BottomNavigationScreenState extends State {
  bottomnavitaController controller = bottomnavitaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          children: bottomNavigationScreen,
          index: controller.selectedindex.value,
        ),
      ),
      bottomNavigationBar: Obx(
        ()=>BottomNavigationBar(
          onTap: (value) {
            controller.updatevalue(value);
          },
          currentIndex: controller.selectedindex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.color3,
          items: [
            BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long),
                  label: 'Payment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.show_chart),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
          ],
        ),
      ),
    );
  }
}