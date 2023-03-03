import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isSearch = false.obs;
  RxBool selectCityBox = false.obs;
  List cities=[
    'Gwalior',
    'Indore',
    'Bhopal',

  ];
}
