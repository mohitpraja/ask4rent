import 'package:ask4rent/core/global/global_var.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:google_maps_webservice/places.dart';

class AddressMapController extends GetxController {
  GoogleMapController? mapController; //contrller for Google map

  Set<Marker> markers = {}; //markers for google map
  Set<Circle> circles = {};
  LatLng showLocation = const LatLng(26.205189, 78.163852);
  @override
  void onInit() {
    markers.add(Marker(
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: const InfoWindow(
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    super.onInit();
  }

  getCurrentLocation() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        zoom: 19,
      ),
    ));
  }

  Future<void> handlePressButton() async {
    // Prediction p = await PlacesAutocomplete.show(
    //   context: context,
    //   apiKey: kGoogleApiKey,
    //   onError: onError,
    //   mode: _mode,
    //   language: "fr",
    //   decoration: InputDecoration(
    //     hintText: 'Search',
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(20),
    //       borderSide: BorderSide(
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    //   components: [Component(Component.country, "fr")],
    // );

    // displayPrediction(p!);
  }

  Future<void> displayPrediction(Prediction p) async {
    logger.wtf('thisi is $p');
  }
}
