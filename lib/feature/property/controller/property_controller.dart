import 'dart:developer';

import 'package:get/get.dart';

class PropertyController extends GetxController{
  String city=Get.arguments[0]['locality'];
  RxString localCity=''.obs;
  List propertyList=[];
  @override
  void onInit() {
    localCity.value=city;
    log('this is City :${localCity.value}');
    super.onInit();
  }

  late List<String> houseImage = [
    "assets/images/house1.jpg",
    "assets/images/house8.webp",
    "assets/images/house9.webp",
    "assets/images/house10.webp",
    "assets/images/house11.webp",
    "assets/images/house12.webp",
    "assets/images/house13.webp",
    "assets/images/house14.webp",
    "assets/images/house15.webp",
    "assets/images/house7.jpg",
    "assets/images/house2.jpg",
    "assets/images/house3.jpg",
    "assets/images/house4.jpg",
    "assets/images/house5.jpg",
    "assets/images/house16.jpg",
  ];


}