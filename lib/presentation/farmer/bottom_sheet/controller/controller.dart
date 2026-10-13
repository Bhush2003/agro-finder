import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class bottomnavitaController extends GetxController {
  RxInt selectedindex = 0.obs;

  void updatevalue(index) {
    selectedindex.value = index;
  }
}