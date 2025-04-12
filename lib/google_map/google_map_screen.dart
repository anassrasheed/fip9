import 'dart:async';

import 'package:fip9/utils/helper/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.0052466, 35.921681),
    zoom: 15,
  );
  var _markers = <Marker>{};

  @override
  void initState() {
    _getMyLocation();

    _markers.add(Marker(
        markerId: MarkerId('1'),
        draggable: true,
        position: _kGooglePlex.target));
    _controller.future.then((value) => value
        .animateCamera(CameraUpdate.newLatLngZoom(_kGooglePlex.target, 16)));
    super.initState();
  }

  Future<void> _getMyLocation() async {
    var result = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(result.latitude, result.longitude), // geolocator geocoder
      zoom: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _markers.isNotEmpty
          ? GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
              circles: {
                Circle(
                    circleId: CircleId('1'),
                    center: _markers.first.position,
                    radius: 50,
                    fillColor: Colors.green.withOpacity(0.3),
                    strokeColor: Colors.green.withOpacity(0.3),
                    strokeWidth: 3)
              },
              onCameraMove: (nPosition) {
                print(nPosition.target.longitude);
                print(nPosition.target.latitude);
                setState(() {
                  _markers.clear();
                  _markers.add(Marker(
                      markerId: MarkerId('1'),
                      draggable: true,
                      position: nPosition.target));
                });
              },
              onCameraIdle: () {
                print("On Camera Idle");
              },
              compassEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
            )
          : Container(
              child: ProgressHud()
                  .createLoadingView(color: Colors.red, size: 100)),
    );
  }
}
