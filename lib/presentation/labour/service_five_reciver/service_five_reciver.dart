import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLabourScreen extends StatefulWidget {
  @override
  _AddLabourScreenState createState() => _AddLabourScreenState();
}

class _AddLabourScreenState extends State<AddLabourScreen> {
  final controller = Get.find<LabourController>();
  late TextEditingController nameCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController aadharCtrl;
  late TextEditingController addressCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: controller.name.value);
    phoneCtrl = TextEditingController(text: controller.phoneNumber.value);
    emailCtrl = TextEditingController(text: controller.email.value);
    aadharCtrl = TextEditingController(text: controller.aadharNumber.value);
    addressCtrl = TextEditingController(text: controller.address.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        backgroundColor: AppColors.color3,
        title: Text("Add Labours", style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField("Name", nameCtrl),
            _buildTextField("Phone Number", phoneCtrl),
            _buildTextField("Email", emailCtrl),
            _buildTextField("Aadhar Number", aadharCtrl),
            _buildTextField("Address", addressCtrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                actionButton("CLEAR", Colors.amber, () => {
                  nameCtrl.clear(),
                  phoneCtrl.clear(),
                  emailCtrl.clear(),
                  aadharCtrl.clear(),
                  addressCtrl.clear()
                }),
                actionButton("SAVE CHANGES", Colors.green, () => {
                  controller.labours.add(nameCtrl.text),
                  Get.back()
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppColors.color1,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget actionButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(backgroundColor: color),
    );
  }
}