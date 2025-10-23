import 'dart:async'; // Import for Completer
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  // Controller to animate the camera
  final Completer<GoogleMapController> _controller = Completer();

  // Initial camera position
  static const CameraPosition _kKolkata = CameraPosition(
    target: LatLng(37.4219983, -122.084),
    zoom: 14,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getCurrentLoc();
  }

  void getCurrentLoc() async {
    if (await checkIfLocGot()) {
      var positions = await Geolocator.getCurrentPosition();
      var currPosition = CameraPosition(
        target: LatLng(positions.latitude, positions.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(currPosition));
      print("lat : ${positions.latitude} long : ${positions.longitude}");
      ///if do not want the marker
      // _markers.add(Marker(
      //     markerId: MarkerId("Current Location"),
      //     position: LatLng(positions.latitude, positions.longitude)));
      // setState(() {});
    } else {
      print("Location not found");
    }
  }

  Future<bool> checkIfLocGot() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        } else if (permission == LocationPermission.deniedForever) {
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _kKolkata,
        // Use the initial position
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        // Use the state variable for markers
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(
              controller); // Complete the controller when map is created
        },
        onTap: (loc) {
          setState(() {
            _markers.add(
                Marker(markerId: MarkerId("New tapped marker"), position: loc));
          });
        },
      ),
    );
  }
}
