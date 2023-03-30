import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
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

  TextEditingController propertyType = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController houseNum = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController furnishingStatus = TextEditingController();
  TextEditingController propertyDescription = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController rent = TextEditingController();

  getRentVal(value) {
    houseRent.value = value.isEmpty || value == null ? 0 : int.parse(value);
    commissionAmt.value = (int.parse(value) * 5) / 100;
    receiveRent.value = int.parse(value) - commissionAmt.value;
  }

  Widget uploadImages = Column(children: [
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
  addProperty() {
    checkInternet(() {
      CustomLoader().loader();
      Fbase.addProperty(
          propertyType.text,
          address.text,
          houseNum.text,
          pin.text,
          city.text,
          state.text,
          area.text,
          furnishingStatus.text,
          propertyDescription.text,
          phone.text,
          email.text,
          rent.text);
    }).then((value) {
      Get.back();
      CustomDialog(
        descText: 'Your property added successfully',
        btnOkOnPress: () => Get.offAllNamed(Routes.dashboard),
      ).success();
    });
  }
}
