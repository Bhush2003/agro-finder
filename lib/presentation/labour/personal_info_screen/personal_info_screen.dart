import 'package:agro_finder_project/presentation/farmer/loginOne_screen/controller/controller.dart';
import 'package:agro_finder_project/presentation/farmer/loginOne_screen/widget/widget.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ProfilelabourScreen extends StatefulWidget {
  const ProfilelabourScreen({Key? key}) : super(key: key);

  @override
  _ProfilelabourScreenState createState() => _ProfilelabourScreenState();
}

class _ProfilelabourScreenState extends State<ProfilelabourScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.color3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Profile', style: TextStyle(color: Colors.white, fontSize: 20)),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.color3,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.color1,
                    child: Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.name.value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(controller.designation.value),
                          Text(controller.zodiac.value),
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text("View Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    buildTile(Icons.person, "Personal Information"),
                    buildTile(Icons.access_time, "Activity"),
                    buildTile(Icons.payment, "Payment Methods"),
                    buildTile(Icons.settings, "Settings"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }

  
}
