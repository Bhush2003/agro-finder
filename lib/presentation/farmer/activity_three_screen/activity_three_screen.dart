import 'package:agro_finder_project/presentation/farmer/activity_three_screen/controller/controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final OtpController controller = Get.put(OtpController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _textControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _textControllers.forEach((ctrl) => ctrl.dispose());
    super.dispose();
  }

  void _handleOtpInput(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }
    controller.otp[index] = value;
  }

  void _submitOtp() {
    final enteredOtp = controller.otp.join();
    if (enteredOtp.length == 4) {
      Get.snackbar('OTP', 'Entered OTP is $enteredOtp',
          backgroundColor: AppColors.color3,
          colorText: AppColors.color6);
    } else {
      Get.snackbar('Error', 'Please enter full OTP',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.color3,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Illustration (replace with your asset if needed)
            SizedBox(
              height: 180,
              child: Image.asset('assets/otp_illustration.png'), // optional
            ),

            const SizedBox(height: 12),

            const Text(
              'We will send you a one-time OTP code on\nYour ID 72589',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 24),

            // OTP input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _textControllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (val) => _handleOtpInput(val, index),
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: AppColors.color2.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            // Confirm Button
            ElevatedButton(
              onPressed: _submitOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color3,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(color: AppColors.color6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
