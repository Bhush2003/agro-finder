import 'package:agro_finder_project/presentation/farmer/persanol_info/controller/controller.dart';
import 'package:agro_finder_project/presentation/farmer/persanol_info/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final PersonalInfoController controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C4A42),
      appBar: AppBar(
        backgroundColor: Color(0xFFCCC04E),
        title: Text(
          'Personal Information',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFD4E2DC),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.pinkAccent),
              ),
              SizedBox(height: 20),
              buildInfoField('Name', controller.name.value),
              buildInfoField('Phone Number', controller.phoneNumber.value),
              buildInfoField('Email', controller.email.value),
              buildInfoField('Aadhar Number', controller.aadharNumber.value),
              buildInfoField('Address', controller.address.value),
            ],
          ),
        ),
      ),
    );
  }
}