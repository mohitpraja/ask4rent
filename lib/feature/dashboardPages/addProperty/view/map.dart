import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  Set<Circle> circles = Set();
  LatLng showLocation = LatLng(26.205189, 78.163852);
  //location to show in map

  @override
  void initState() {
    circles.add(Circle(circleId: CircleId('circle'), radius: 0));
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map in Flutter"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GoogleMap(
        //Map widget from google_maps_flutter package

        initialCameraPosition: CameraPosition(
          //innital position in map
          target: showLocation, //initial position
          zoom: 18, //initial zoom level
        ),
        circles: circles,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: markers, //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
            mapController!.setMapStyle(jsonEncode([
              {
                "elementType": "geometry",
                "stylers": [
                  {"color": "#242f3e"}
                ]
              },
              {
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#746855"}
                ]
              },
              {
                "elementType": "labels.text.stroke",
                "stylers": [
                  {"color": "#242f3e"}
                ]
              },
              {
                "featureType": "administrative",
                "elementType": "geometry",
                "stylers": [
                  {"visibility": "off"}
                ]
              },
              {
                "featureType": "administrative.locality",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#d59563"}
                ]
              },
              {
                "featureType": "poi",
                "stylers": [
                  {"visibility": "off"}
                ]
              },
              {
                "featureType": "poi",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#d59563"}
                ]
              },
              {
                "featureType": "poi.park",
                "elementType": "geometry",
                "stylers": [
                  {"color": "#263c3f"}
                ]
              },
              {
                "featureType": "poi.park",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#6b9a76"}
                ]
              },
              {
                "featureType": "road",
                "elementType": "geometry",
                "stylers": [
                  {"color": "#38414e"}
                ]
              },
              {
                "featureType": "road",
                "elementType": "geometry.stroke",
                "stylers": [
                  {"color": "#212a37"}
                ]
              },
              {
                "featureType": "road",
                "elementType": "labels.icon",
                "stylers": [
                  {"visibility": "off"}
                ]
              },
              {
                "featureType": "road",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#9ca5b3"}
                ]
              },
              {
                "featureType": "road.highway",
                "elementType": "geometry",
                "stylers": [
                  {"color": "#746855"}
                ]
              },
              {
                "featureType": "road.highway",
                "elementType": "geometry.stroke",
                "stylers": [
                  {"color": "#1f2835"}
                ]
              },
              {
                "featureType": "road.highway",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#f3d19c"}
                ]
              },
              {
                "featureType": "transit",
                "stylers": [
                  {"visibility": "off"}
                ]
              },
              {
                "featureType": "transit",
                "elementType": "geometry",
                "stylers": [
                  {"color": "#2f3948"}
                ]
              },
              {
                "featureType": "transit.station",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#d59563"}
                ]
              },
              {
                "featureType": "water",
                "elementType": "geometry",
                "stylers": [
                  {"color": "#17263c"}
                ]
              },
              {
                "featureType": "water",
                "elementType": "labels.text.fill",
                "stylers": [
                  {"color": "#515c6d"}
                ]
              },
              {
                "featureType": "water",
                "elementType": "labels.text.stroke",
                "stylers": [
                  {"color": "#17263c"}
                ]
              }
            ]));
            // mapController!.setMapStyle(
            //     '[{"featureType": "all","stylers": [{ "color": "#000000" }]},{"featureType": "road.arterial","elementType": "geometry","stylers": [{ "color": "#CCFFFF" }]},{"featureType": "landscape","elementType": "labels","stylers": [{ "visibility": "off" }]}]');
          });
        },
      ),
    );
  }
}
