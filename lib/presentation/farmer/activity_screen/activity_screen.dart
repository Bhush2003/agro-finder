import 'dart:convert';

import 'package:agro_finder_project/presentation/farmer/activity_screen/controller/activity_screen_controller.dart';
import 'package:agro_finder_project/theam/app_colors.dart';
import 'package:agro_finder_project/theam/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:agro_finder_project/core/map.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State {
  AppStyle as = AppStyle();
  MapController mapcontroller = MapController();
  ActivityScreenController controller = Get.put(ActivityScreenController());
  LatLng? currentLocation;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // Get location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      controller.currentLocation.value = LatLng(
        position.latitude,
        position.longitude,
      );
    });
  }

  LatLng? _searchedLocation;
  LatLng _mapCenter = LatLng(20.5937, 78.9629);

  Future<void> _searchLocation(String query) async {
    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1';
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'FlutterApp (your@email.com)'},
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        final result = LatLng(lat, lon);

        setState(() {
          _searchedLocation = result;
          _mapCenter = result;
        });

        mapcontroller.move(result, 15); // Zoom in
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Location not found')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        backgroundColor: AppColors.color3,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: AppColors.color1,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.color3,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text("Order", style: as.textStyle10()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onSubmitted: _searchLocation,
                decoration: InputDecoration(
                  hintText: "Enter location (e.g., Delhi, Mumbai)",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _searchLocation(_searchController.text),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              height: 823,
              width: 390,
              child: FlutterMap(
                mapController: mapcontroller,
                options: MapOptions(
                  onTap: (tapPosition, point) {},
                  initialCenter: controller.currentLocation.value,
                  initialZoom: 0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  CurrentLocationLayer(
                    style: LocationMarkerStyle(
                      marker: DefaultLocationMarker(
                        child: Icon(
                          Icons.location_pin,
                          color: AppColors.color1,
                        ),
                      ),
                      markerSize: Size(10, 10),
                      markerDirection: MarkerDirection.heading,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.currentLocation.value != null) {
            mapcontroller.move(controller.currentLocation.value, 13);
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("location not available")));
          }
        },
        elevation: 0,
        backgroundColor: AppColors.color3,
        child: Icon(Icons.my_location, color: AppColors.color1),
      ),
    );
  }
}
