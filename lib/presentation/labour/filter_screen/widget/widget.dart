import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLabourButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CustomLabourButton({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // isSelected = true;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.color3 : AppColors.color1,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

Widget buildButton(IconData icon, VoidCallback onPressed) {
    return Material(
      color: const Color(0xFF8A8A22), // Yellow-green color for buttons
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }