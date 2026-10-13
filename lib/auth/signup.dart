import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/presentation/farmer/otp_screen/controller/otp_screen_controller.dart';
import 'package:agro_finder_project/presentation/farmer/otp_screen/otp_screens.dart';
import 'package:agro_finder_project/presentation/farmer/signup_screen/controller/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  void signupwithemail() async {
    createAccount(email.text, password.text);
  }

  Future<String> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Account Created";
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        return "Weak Password";
      } else if (ex.code == "email-already-in-use") {
        return "Email Already exists Login Please!";
      }
      return "";
    } catch (ex) {
      print(ex);
      return "";
    }
  }
}


