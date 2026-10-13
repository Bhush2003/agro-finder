import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LabourController extends GetxController {
  var groups = <String>["Labour Group 1"].obs;
  var labours =
      <String>[
        "Bhargavi Hadgekar",
        "Bhargavi Hadgekar",
        "Bhargavi Hadgekar",
        "Bhargavi Hadgekar",
        "Bhargavi Hadgekar",
      ].obs;
  var name = 'Bhargavi Hadgekar'.obs;
  var phoneNumber = '96985556325'.obs;
  var email = 'bhargavih@gmail.com'.obs;
  var aadharNumber = '5596 3355 4485'.obs;
  var address = 'xyz streeabc colony Pune'.obs;

  var currentIndex = 0.obs;
}
