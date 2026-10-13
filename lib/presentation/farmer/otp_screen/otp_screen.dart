import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.color3),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/loginPage/Group 2.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 30),
                Text(
                  "Verify Your Phone",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color3,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter the OTP sent to your phone number",
                  style: TextStyle(fontSize: 16, color: AppColors.color3),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.color3,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.color3),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    }
                    if (value.length != 6) {
                      return 'OTP must be 6 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Obx(
                  () => ElevatedButton(
                    onPressed:
                        _authController.isLoading.value
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                _authController.verifyOtp(_otpController.text);
                              }
                            },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.color3,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:
                        _authController.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                              "Verify OTP",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Resend OTP functionality can be added here
                    Get.snackbar(
                      'Info',
                      'Resend OTP functionality will be implemented',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: Text(
                    "Didn't receive OTP? Resend",
                    style: TextStyle(color: AppColors.color3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
