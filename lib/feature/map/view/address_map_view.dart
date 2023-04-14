import 'dart:convert';

import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/searchbox.dart';
import 'package:ask4rent/feature/map/controller/address_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMapView extends GetView<AddressMapController> {
  const AddressMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: controller.showLocation, //initial position
                    zoom: 18, //initial zoom level
                  ),
                  // myLocationButtonEnabled: true,
                  // myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  markers: controller.markers, //markers to show on map
                  onMapCreated: (mapCreatedController) {
                    controller.mapController = mapCreatedController;
                    controller.mapController!.setMapStyle(jsonEncode(mapStyle));
                  },
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 40),
                    width: Get.width,
                    child: CustomSearchField(
                      onChanged: (p0) => controller.autoComplete(p0),
                    ),
                    // child: CustomElevatedButton(
                    //   onPress: controller.handlePressButton,
                    //   bgColor: white,
                    //   textColor: lightBlack,
                    //   title: "Search places...",
                    // ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FloatingActionButton(
                      backgroundColor: white,
                      onPressed: () {
                        controller.getCurrentLocation();
                      },

                      child: const Icon(
                        FontAwesomeIcons.locationCrosshairs,
                        color: lightBlack,
                      ),
                   
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Column(children: [
              const Text('this is demo'),
              commonSpace(),
              SizedBox(
                width: Get.width,
                child: CustomElevatedButton(
                  title: 'Done'.toUpperCase(),
                  onPress: () {},
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
