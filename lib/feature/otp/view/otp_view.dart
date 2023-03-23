import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/feature/otp/controller/otp_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Stack(
          children: [
            Positioned(
              top: -.1,
              child: Container(
                width: Get.width,
                height: Get.height,
                color: primaryColor,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/password.png',
                      height: Get.height * 0.12,
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                          fontSize: Get.height * 0.035,
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontFamily: alata),
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    Text(
                      'Please enter the OTP send to your mobile number',
                      style: TextStyle(
                          color: white,
                          fontSize: Get.height * 0.018,
                          fontWeight: FontWeight.w500,
                          fontFamily: alata),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                height: Get.height * 0.6,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 20.0,
                        offset: Offset(3.0, 3.0))
                  ],
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '+91 ${controller.phone}',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            Pinput(
                              length: 6,
                              pinAnimationType: PinAnimationType.fade,
                              defaultPinTheme: controller.defaultPinTheme,
                              onChanged: (value) => controller.otp = value,
                            ),
                            Text(
                              "Didn't recieve an OTP",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: Get.height * 0.02,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                                )),
                            SizedBox(
                              width: Get.width,
                              child: CustomElevatedButton(
                                title: 'Verify',
                                disableText: 'Verfying...',
                                onPress: () {
                                  isButtonDisable.value = true;
                                  if (controller.page == 'signupPage') {
                                    verifyOTP(controller.otp,
                                        controller.verificationId, () {
                                      Fbase.createUser(
                                              controller.name,
                                              controller.email,
                                              controller.password,
                                              controller.phone)
                                          .then((value) {
                                        isButtonDisable.value = false;
                                        CustomDialog(
                                                btnOkOnPress: () =>
                                                    Get.offAllNamed(
                                                        Routes.login),
                                                isDismissable: false,
                                                descText:
                                                    'You have successfully signed up')
                                            .success();
                                      });
                                    });
                                  } else if (controller.page == 'forgotPage') {
                                    verifyOTP(
                                        controller.otp,
                                        controller.verificationId,
                                        () {
                                          isButtonDisable.value=false;
                                          Get.offAllNamed(Routes.forgotPass,arguments: [{'phone':controller.phone}]);
                                        });
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
