import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceFourScreen extends StatefulWidget {
  const ServiceFourScreen({super.key});

  @override
  State<ServiceFourScreen> createState() => _ServiceFourScreenState();
}

class _ServiceFourScreenState extends State<ServiceFourScreen> {
  final LabourController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Status box
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.color2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        TranslationKeys.completedHarvesting.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${TranslationKeys.labourId.tr} : 7568',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // ... rest of the widget tree
              ],
            ),
          ),
        ),
      ),
    );
  }
}
