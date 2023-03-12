import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/widgets/custom_white_appbar.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/custom_scroll.dart';
import 'package:ask4rent/feature/forgot/controller/forgot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: const CustomWhiteAppBar(),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height * 0.75,
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
                      child: CustomTextFormField(
                        hintText: 'Phone Number',
                        prefixIcon: const Icon(Icons.phone),
                        inputType: TextInputType.number,
                        maxLength: 10,
                        controller: controller.phone,
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: CustomElevatedButton(
                        title: 'Reset Password',
                        onPress: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
