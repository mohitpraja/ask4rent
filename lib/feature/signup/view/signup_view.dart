import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/apptitle.dart';
import 'package:ask4rent/core/widgets/custom_white_appbar.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_passwordfield.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/custom_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar:const CustomWhiteAppBar(),
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
                        style:
                            TextStyle(color: lightBlack, fontSize: Get.width * 0.04),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height*0.06,
                  ),
                  Form(
                      child: Column(
                    children: [
                      const CustomTextFormField(
                        hintText: 'Enter Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      commonSpace(),
                      const CustomTextFormField(
                        hintText: 'Enter Email',
                        inputType: TextInputType.emailAddress,
                         prefixIcon: Icon(Icons.email),
                      ),
                      commonSpace(),
                      const CustomTextFormField(
                        hintText: 'Enter Phone',
                        inputType: TextInputType.number,
                         prefixIcon: Icon(Icons.phone),
                      ),
                      commonSpace(),
                      const CustomPasswordField(),
                      commonSpace(),
                      const CustomPasswordField(hintext: 'Confirm Password',),
                       commonSpace(),
                      SizedBox(
                        width: Get.width,
                        child: CustomElevatedButton(title: 'Create Account',onPress: () {
                          Get.toNamed(Routes.otp);
                        },),
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
                                style: TextStyle(color: primaryColor, fontFamily: alata,fontWeight: FontWeight.bold,fontSize: Get.width*0.04),
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
