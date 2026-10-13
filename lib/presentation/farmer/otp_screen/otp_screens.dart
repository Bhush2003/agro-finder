import 'package:agro_finder_project/auth/auth_controller.dart';
import 'package:agro_finder_project/presentation/farmer/otp_screen/controller/otp_screen_controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// OTP Verification Page
class OTPVerificationPage extends StatefulWidget {
  final String filename;
  final String varificationId;

  const OTPVerificationPage({
    Key? key,
    required this.filename,
    required this.varificationId,
  }) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final Otp_screen_controller controller = Get.put(Otp_screen_controller());
  final AuthController authController = Get.find<AuthController>();
  AppStyle as = AppStyle();
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    print(
      'Initializing OTP screen with verification ID: ${widget.varificationId}',
    );
    // Set verification ID in auth controller
    authController.verificationId.value = widget.varificationId;
    // Clear any existing OTP when screen loads
    controller.clearOtp();
    // Focus the first OTP field
    focusNodes[0].requestFocus();
  }

  void _handleOtpInput(String value, int index) {
    if (value.isNotEmpty) {
      controller.updateOTP(index, value);
      if (index < 5) {
        focusNodes[index + 1].requestFocus();
      }
    }
  }

  void _handleBackspace(int index) {
    if (index > 0 && otpControllers[index].text.isEmpty) {
      focusNodes[index - 1].requestFocus();
      controller.handleBackspace(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final screenHeight = size.height - padding.top - padding.bottom;
    final screenWidth = size.width;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/otp_screen/Group 25.png",
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.color3,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Enter the OTP sent to your phone number",
                  style: TextStyle(fontSize: 16, color: AppColors.color3),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.04),
                // OTP Input Fields
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: screenWidth * 0.12,
                        child: TextField(
                          controller: otpControllers[index],
                          focusNode: focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.color3,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.color3.withOpacity(0.3),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: AppColors.color3,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (value) => _handleOtpInput(value, index),
                          onEditingComplete: () {
                            if (index < 5) {
                              focusNodes[index + 1].requestFocus();
                            }
                          },
                          onSubmitted: (value) {
                            if (value.isNotEmpty && index < 5) {
                              focusNodes[index + 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Obx(
                  () => GestureDetector(
                    onTap:
                        controller.isLoading.value
                            ? null
                            : controller.verifyOtp,
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.color3,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child:
                          controller.isLoading.value
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text("Verify OTP", style: as.textStyle5()),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(
                  () => GestureDetector(
                    onTap:
                        controller.isLoading.value
                            ? null
                            : controller.resendOtp,
                    child: Text(
                      "Didn't receive OTP? Resend",
                      style: TextStyle(
                        color: AppColors.color3,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
