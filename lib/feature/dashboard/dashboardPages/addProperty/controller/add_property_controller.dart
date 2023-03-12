import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  RxInt currentStep = 0.obs;
  final basicInfoFormKey = GlobalKey<FormState>();
  final propertyDetailsFormKey = GlobalKey<FormState>();
  final contactDetailsFormKey = GlobalKey<FormState>();
  final priceFormKey = GlobalKey<FormState>();

  RxInt houseRent = 0.obs;
  RxDouble commissionAmt = (0.0).obs;
  RxDouble receiveRent = (0.0).obs;

  getRentVal(value) {
    houseRent.value = value.isEmpty || value == null ? 0 : int.parse(value);
    commissionAmt.value = (int.parse(value) * 5) / 100;
    receiveRent.value = int.parse(value) - commissionAmt.value;
  }

  Widget uploadImages = Column(
    children:[
    Row(
      children: [
        Expanded(
          child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
              child: Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.contain,
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
              child: Image.asset(
                'assets/images/forgotpass.png',
                fit: BoxFit.contain,
              )),
        ),
      ],
    ),
  ]);
}
