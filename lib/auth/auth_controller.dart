import 'package:agro_finder_project/presentation/farmer/bottom_sheet/bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final RxBool isLoading = false.obs;
  final Rx<User?> user = Rx<User?>(null);
  final RxString verificationId = ''.obs;
  final RxBool isOtpSent = false.obs;
  final RxString phoneNumber = ''.obs;
  final RxBool isVerificationInProgress = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
    loadVerificationId();
  }

  Future<void> loadVerificationId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedVerificationId = prefs.getString('verification_id');
      if (savedVerificationId != null && savedVerificationId.isNotEmpty) {
        verificationId.value = savedVerificationId;
      }
    } catch (e) {
      print('Error loading verification ID: $e');
    }
  }

  Future<void> saveVerificationId(String vId) async {
    try {
      if (vId.isEmpty) {
        print('Attempting to save empty verification ID');
        return;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('verification_id', vId);
      verificationId.value = vId;
      print('Saved verification ID: $vId');
    } catch (e) {
      print('Error saving verification ID: $e');
      verificationId.value = '';
    }
  }

  // Email/Password Authentication
  Future<void> registerWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Send email verification
      await userCredential.user?.sendEmailVerification();

      Get.snackbar(
        'Success',
        'Registration successful! Please verify your email.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists for that email.';
      }
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      print('Attempting to login with email: $email'); // Debug print
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(
        'Login successful for user: ${userCredential.user?.uid}',
      ); // Debug print
    } catch (e) {
      print('Login error: $e'); // Debug print
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        Get.snackbar(
          'Error',
          'Google sign in was cancelled',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        Get.snackbar(
          'Success',
          'Google sign in successful!',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Google sign in error: $e');
      Get.snackbar(
        'Error',
        'Failed to sign in with Google',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      Get.snackbar(
        'Success',
        'Logged out successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to logout',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Phone Authentication
  Future<void> sendOtp(String phone) async {
    try {
      isLoading.value = true;
      phoneNumber.value = phone;
      print('Sending OTP to: $phone'); // Debug print
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: $e'); // Debug print
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId.value = verificationId;
          isOtpSent.value = true;
          print('OTP sent successfully'); // Debug print
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } catch (e) {
      print('Send OTP error: $e'); // Debug print
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      isLoading.value = true;
      print('Verifying OTP: $otp'); // Debug print
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      print('OTP verification successful'); // Debug print
    } catch (e) {
      print('OTP verification error: $e'); // Debug print
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
