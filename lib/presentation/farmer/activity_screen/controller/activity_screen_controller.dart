import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ActivityScreenController extends GetxController {
  Rx currentLocation = LatLng(0, 0).obs;
  RxDouble focus = 13.0.obs;

  void setcurrentLocation(LatLng currLocation) {
    currentLocation.value = currLocation;
  }
}
