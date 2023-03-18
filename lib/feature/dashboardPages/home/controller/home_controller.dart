import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    Box<dynamic> db = await Hive.openBox('ask4rent');
    userId = db.get('id');

    super.onInit();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isSearch = false.obs;
  RxBool selectCityBox = false.obs;
  String userId = '';
}
