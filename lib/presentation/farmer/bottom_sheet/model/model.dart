import 'package:agro_finder_project/presentation/farmer/activity_one_screen/activity_one_screen.dart';
import 'package:agro_finder_project/presentation/farmer/loginOne_screen/loginOne_screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_provider_screen/service_provider_screen.dart';
import 'package:agro_finder_project/presentation/labour/service_provider_one_screen/service_provider_one_screen.dart';
import 'package:agro_finder_project/presentation/farmer/payment_screen/payment_screen.dart';
import 'package:flutter/material.dart';

List<Widget> bottomNavigationScreen = [
  ServiceProvider(),
  PaymentScreen(),
  ActivityOneScreen(),
  ProfileScreen(),
];
