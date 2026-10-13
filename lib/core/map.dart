import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OsmMapMethods {
  
  void currentLocation(MapController mcontroller,LatLng currentLocation, BuildContext context) {
    if (currentLocation != null) {
      mcontroller.move(currentLocation, 10);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("location not available")));
    }
  }
}
