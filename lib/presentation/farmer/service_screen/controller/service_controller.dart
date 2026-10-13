import 'package:agro_finder_project/presentation/farmer/bottom_sheet/bottom_sheet.dart';
import 'package:agro_finder_project/presentation/farmer/login_one_screen/login_One_Screen.dart';
import 'package:agro_finder_project/presentation/farmer/service_provider_screen/service_provider_screen.dart';
import 'package:agro_finder_project/presentation/labour/service_reciver/service_reciver.dart';
import 'package:agro_finder_project/translations/app_translations.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  final RxString selectedUserType = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print('ServiceController initialized'); // Debug print
  }

  void selectUserType(String userType) {
    print('Setting user type to: $userType'); // Debug print
    selectedUserType.value = userType;
    Get.to(() => LoginOneScreen());
  }

  void handleLoginSuccess() {
    print(
      'Handling login success for user type: ${selectedUserType.value}',
    ); // Debug print
    if (selectedUserType.value == TranslationKeys.farmer.tr) {
      print('Navigating to BottomNavigationScreen'); // Debug print
      Get.offAll(() => BottomNavigationScreen());
    } else {
      print('Navigating to AddGroupScreen'); // Debug print
      Get.offAll(() => AddGroupScreen());
    }
  }

  String get currentUserType => selectedUserType.value;
}
