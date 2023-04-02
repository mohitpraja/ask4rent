import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPropertyController extends GetxController {
  RxInt currentStep = 0.obs;
  final basicInfoFormKey = GlobalKey<FormState>();
  final propertyDetailsFormKey = GlobalKey<FormState>();
  final contactDetailsFormKey = GlobalKey<FormState>();
  final priceFormKey = GlobalKey<FormState>();

  RxInt houseRent = 0.obs;
  RxDouble commissionAmt = (0.0).obs;
  RxDouble receiveRent = (0.0).obs;
  RxList finalImages = [].obs;

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
  choosePic() {
    Get.bottomSheet(
      SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Choose Profile Picture',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Gallery'),
                    ],
                  ),
                  onTap: () async{

                     Get.back();
                          final List<XFile> images =
                              await ImagePicker().pickMultiImage();
                          finalImages.addAll(images);
                  },
                ),
                const SizedBox(
                  width: 60,
                ),
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 30,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Camera')
                    ],
                  ),
                  onTap: () async{
                     Get.back();
                          final XFile? img = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          finalImages.add(img);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }




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
