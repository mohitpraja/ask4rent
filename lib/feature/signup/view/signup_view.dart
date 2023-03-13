import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/validation.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/apptitle.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/core/widgets/custom_white_appbar.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_passwordfield.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/custom_scroll.dart';
import 'package:ask4rent/feature/signup/controller/signup_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: const CustomWhiteAppBar(),
        body: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      const AppTitle(),
                      Text(
                        'Start with your free account today',
                        style: TextStyle(
                            color: lightBlack, fontSize: Get.width * 0.04),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Form(
                      key: controller.signupFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Enter Name',
                            prefixIcon: const Icon(Icons.person),
                            validator: (p0) => nameValidator(p0),
                            controller: controller.name,
                          ),
                          commonSpace(),
                          CustomTextFormField(
                            hintText: 'Enter Email',
                            inputType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email),
                            validator: (p0) => emailValidator(p0),
                            controller: controller.email,
                          ),
                          commonSpace(),
                          CustomTextFormField(
                            hintText: 'Enter Phone',
                            inputType: TextInputType.number,
                            maxLength: 10,
                            prefixIcon: const Icon(Icons.phone),
                            validator: (p0) => phoneValidator(p0),
                            controller: controller.phone,
                          ),
                          commonSpace(),
                          CustomPasswordField(
                            validator: (p0) => passwordValidator(p0),
                            controller: controller.password,
                          ),
                          commonSpace(),
                          CustomPasswordField(
                            hintext: 'Confirm Password',
                            validator: (p0) => confirmPasswordValidator(
                                p0, controller.password.text),
                          ),
                          commonSpace(),
                          SizedBox(
                            width: Get.width,
                            child: CustomElevatedButton(
                              title: 'Create Account',
                              onPress: () {
                                if (controller.signupFormKey.currentState!
                                    .validate()) {
                                  checkInternet(
                                    () {
                                      sendOtp(
                                        controller.phone.text,
                                        () {
                                          print('cld');
                                          Get.toNamed(Routes.otp, arguments: [
                                            verificationid,
                                            controller.name.text,
                                            controller.email.text,
                                            controller.phone.text,
                                            controller.password.text
                                          ]);
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      )),
                  SizedBox(height: Get.height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(color: lightBlack, fontFamily: alata),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.login),
                        child: Text(
                          'Login here',
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: alata,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.04),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
