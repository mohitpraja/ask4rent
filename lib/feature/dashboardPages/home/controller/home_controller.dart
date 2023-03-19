import 'dart:async';

import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    db = await Hive.openBox('ask4rent');
    userId =db.get('userId');
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
  
}
