import 'package:agro_finder_project/presentation/farmer/login_screen/login_screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_screen/service_screen.dart';
import 'package:get/get.dart';

class LoginOneController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool checke = false.obs;
  RxBool checkp = false.obs;

  bool isValidEmail(String email) {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email);
  }

  String? validatePassword(String value) {
    RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  void Login() {
    Get.to(ServiceScreen());
    
  }
}
