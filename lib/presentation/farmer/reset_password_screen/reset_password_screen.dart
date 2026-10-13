import 'package:agro_finder_project/presentation/farmer/reset_password_screen/controller/controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4, // wrapper dark background
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can replace this with your own image asset
            SizedBox(
              height: 180,
              child: Image.asset('assets/images/reset_password_screen/undraw_secure_login_pdn4 1 (1).png'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Obx(() => TextField(
                  onChanged: (val) => controller.password.value = val,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green[200]?.withOpacity(0.3),
                    hintText: 'Reset Password',
                    suffixIcon: controller.isPasswordValid
                        ? const Icon(Icons.check, color: Colors.greenAccent)
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => TextField(
                  onChanged: (val) =>
                      controller.confirmPassword.value = val,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green[200]?.withOpacity(0.3),
                    hintText: 'Confirm Password',
                    suffixIcon: controller.isConfirmPasswordValid
                        ? const Icon(Icons.check, color: Colors.greenAccent)
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (controller.isConfirmPasswordValid) {
                  Get.snackbar('Success', 'Password reset successful!',
                      backgroundColor: Colors.green,
                      colorText: Colors.white);
                } else {
                  Get.snackbar('Error', 'Passwords do not match',
                      backgroundColor: Colors.red,
                      colorText: Colors.white);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      
    );
  }
}
