import 'package:ask4rent/feature/ownerSeeker/owner/view/owner_view.dart';
import 'package:ask4rent/feature/ownerSeeker/seeker/view/seeker_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerSeekerController extends GetxController {
  final tabPages = <Widget>[OwnerView(), SeekerView()];
  final tabs = <Tab>[
    Tab(
        child: Text(
      'As owner',
      style: TextStyle(fontSize: Get.width * 0.05, color: Colors.black54),
    )),
    Tab(
        child: Text(
      'As seeker',
      style: TextStyle(fontSize: Get.width * 0.05, color: Colors.black54),
    )),
  ];
}
