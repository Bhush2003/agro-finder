import 'package:get/get.dart';


class CounterLabourController extends GetxController {
  var count = 2.obs;

  void increment() => count++;
  void decrement() {
    if (count > 0) count--;
  }
}
