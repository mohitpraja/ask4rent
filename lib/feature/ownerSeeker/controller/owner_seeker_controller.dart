import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/feature/ownerseekpages/owner/view/owner_view.dart';
import 'package:ask4rent/feature/ownerseekpages/seeker/view/seeker_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerSeekerController extends GetxController {
  final tabPages = <Widget>[const OwnerView(), const SeekerView()];
  final tabs = <Tab>[
    Tab(
        child: Text(
      'As owner',
      style: TextStyle(fontSize: Get.width * 0.05, color: Colors.black54,fontFamily: alata),
    )),
    Tab(
        child: Text(
      'As seeker',
      style: TextStyle(fontSize: Get.width * 0.05, color: Colors.black54,fontFamily: alata),
    )),
  ];
}
