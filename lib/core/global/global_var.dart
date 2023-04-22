// var userId='';
import 'package:ask4rent/core/widgets/logger/logger.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

RxMap userInfo = {}.obs;
RxString currLocation = ''.obs;
RxString currAddress = ''.obs;
RxString postStatus = '0'.obs;
RxList localitiesByCity = [].obs;
RxBool isInternet = false.obs;
List<String>? propertyImagesUrls = [];
var logger = Logger();
Position? currentPosition;
const kGoogleApiKey = "AIzaSyCoAEij3160njXQcrfSAvzeA461Ty-j-bs";

var mapStyle = [
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
];
