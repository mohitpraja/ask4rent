import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/localDB/cities.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    db = await Hive.openBox('ask4rent');
    userId = db.get('userId');
    super.onInit();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isSearch = false.obs;
  RxBool selectCityBox = false.obs;
  String userId = '';
  RxBool isBuild = false.obs;
  late Box<dynamic> db;
  List userList = [];
  Stream<QuerySnapshot<Object?>> profileStream =
      Fbase.firestore.collection('users').snapshots();
  setLoclity() {
    popularLocalities.forEach((key, value) {
      if (key == currLocation.value) {
        print(key);
        print(value);
        print('match');
        localitiesByCity.value = value;
        log('$localitiesByCity');
      }
    });
  }
}
