import 'package:agro_finder_project/presentation/farmer/persanol_info/persanol_info.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

Widget buildTile(IconData icon, String label) {
  return Card(
    color: AppColors.color3,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      leading: Icon(icon, color: AppColors.color6),
      title: Text(label, style: const TextStyle(color: AppColors.color6)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.color6,
      ),
      onTap: () {
        Get.to(PersonalInfoScreen());
      },
    ),
  );
}
