import 'dart:async';
import 'dart:developer';
import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/localDB/cities.dart';
import 'package:ask4rent/core/widgets/nodatafound.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    db = await Hive.openBox('ask4rent');
    userId = db.get('userId');
    filterData('');
    // setLoclity();
    getCurrentPosition();
    super.onInit();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isSearch = false.obs;
  RxBool selectCityBox = false.obs;
  String userId = '';
  RxBool isBuild = false.obs;
  RxBool isLoader = false.obs;
  late Box<dynamic> db;
  List userList = [];
  RxList filterList = [].obs;
  Stream<QuerySnapshot<Object?>> profileStream =
      Fbase.firestore.collection('users').snapshots();
  setLoclity() {
    popularLocalities.forEach((key, value) {
      if (key == currLocation.value) {
        localitiesByCity.value = value;
        // log('$localitiesByCity');
      }
    });
    // popularLocalities.forEach((key, value) { log(key);});
  }

  searchCity() {
    Get.dialog(
        barrierDismissible: false,
        Center(
          child: SizedBox(
            width: Get.width * 0.75,
            height: Get.height * 0.7,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: white,
              body: Column(
                children: [
                  Container(
                    width: Get.width,
                    height: 60,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    color: primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select City',
                          style: TextStyle(
                              color: white,
                              letterSpacing: 1,
                              fontFamily: alata,
                              fontSize: Get.width * 0.05),
                        ),
                        IconButton(
                            onPressed: () {
                              filterData('');
                              Get.back();
                            },
                            icon: Icon(Icons.close, color: white))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(Icons.search)),
                      onChanged: (value) {
                        filterData(value);
                      },
                    ),
                  ),
                  ScrollGlowRemover(
                    child: Obx(() => Expanded(
                          child: filterList.isEmpty
                              ? const NoDataFound()
                              : ListView.builder(
                                  itemCount: filterList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        currLocation.value = filterList[index];
                                        setLoclity();
                                        filterData('');
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black26,
                                                    width: .5))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 10),
                                          child: Text(
                                            filterList[index],
                                            style: TextStyle(
                                                color: lightBlack,
                                                fontFamily: ubuntu),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  filterData(value) {
    List result = cities;
    if (value.isEmpty || value == '') {
      result = cities;
    } else {
      result = cities
          .where((element) => element
              .toLowerCase()
              .toUpperCase()
              .contains(value.toLowerCase().toUpperCase()))
          .toList();
    }
    filterList.value = result;
  }

  getCurrentPosition() async {
    //permission
    // ignore: unused_local_variable
    String address;
    currLocation.value = '';
    isLoader.value = true;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      List<Placemark> placemark = await placemarkFromCoordinates(
          currentposition.latitude, currentposition.longitude);

      currAddress.value =
          '${placemark[0].name},${placemark[0].street},${placemark[0].isoCountryCode},${placemark[0].country},${placemark[0].postalCode},${placemark[0].administrativeArea},${placemark[0].subAdministrativeArea},${placemark[0].locality},${placemark[0].subLocality},${placemark[0].thoroughfare},${placemark[0].subThoroughfare}';
      String locality = placemark[0].subAdministrativeArea!.split(' ').first;

      currLocation.value =
          placemark[0].subAdministrativeArea == '' ? 'Gwalior' : locality;
      setLoclity();
      isLoader.value = false;
    }
  }
}
