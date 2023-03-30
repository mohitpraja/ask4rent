import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/validation.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/core/widgets/custom_white_appbar.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/feature/forgot/controller/forgot_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: true,
      appBar: const CustomWhiteAppBar(),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollGlowRemover(
          child: SingleChildScrollView(
            child: Obx(() => Container(
                          height: Get.height * 0.7,
                          margin: const EdgeInsets.all(12),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/images/forgotpass.png',
                                  height: Get.height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Forgot Password ?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Get.width * 0.07,
                                          fontFamily: alata,
                                          color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      'Enter your phone number to retrieve your password',
                                      textAlign: TextAlign.center,
        
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Get.width * 0.045,
                              fontFamily: alata,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    Form(
                      key: controller.forgotFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                            inputType: TextInputType.number,
                            maxLength: 10,
                            controller: controller.phone,
                            validator: (p0) => phoneValidator(p0),
                            onchanged: (p0) {
                              Fbase.isPhoneExist.value = true;
                            },
                          ),
                          !(Fbase.isPhoneExist.value)
                              ? Column(
                                  children: [
                                    commonSpace1(),
                                    Row(
                                      children: const [
                                        Text(
                                          'Phone number not registered',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    commonSpace1()
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: CustomElevatedButton(
                        title: 'Reset Password',
                        onPress: () {
                          Fbase.isPhoneExist.value = true;
                          if (controller.forgotFormKey.currentState!
                              .validate()) {
                            checkInternet(() {
                              Fbase.checkUser(controller.phone.text, '')
                                  .then((value) {
                                if ((Fbase.isPhoneExist.value)) {
                                  CustomLoader().loader();
                                  sendOtp(
                                    controller.phone.text,
                                    () {
                                      Get.back();
                                      Get.toNamed(Routes.otp, arguments: [
                                        {
                                          'verification': verificationid,
                                          'phone': controller.phone.text,
                                        },
                                        'forgotPage'
                                      ]);
                                    },
                                  );
                                }
                              });
                            });
                          }
                          // sendOtp(controller.phone.text);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
