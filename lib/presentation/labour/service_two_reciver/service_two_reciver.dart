import 'package:agro_finder_project/presentation/labour/service_reciver/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController groupController = TextEditingController(text: "Labour Group 1");
  final LabourController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C4A42),
      appBar: AppBar(
        backgroundColor: Color(0xFFCCC04E),
        title: Text('Create Group', style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: groupController,
              decoration: InputDecoration(
                labelText: 'Group Name',
                filled: true,
                fillColor: Color(0xFFD4E2DC),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton("CLEAR", Colors.amber, () => groupController.clear()),
                _actionButton("CREATE", Colors.green, () {
                  controller.groups.add(groupController.text);
                  Get.back();
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _actionButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(backgroundColor: color),
    );
  }
}

