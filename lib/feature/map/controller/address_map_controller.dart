import 'package:ask4rent/core/global/global_var.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:math';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
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
    Prediction? p = await PlacesAutocomplete.show(
        apiKey: kGoogleApiKey,
        context: Get.context!,
        mode: Mode.overlay,
        language: "fr",
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            )),
        components: [new Component(Component.country, "fr")]);

    // displayPrediction(p!);
  }

  Future<void> displayPrediction(Prediction p) async {
    logger.wtf('thisi is $p');
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
  }
}
