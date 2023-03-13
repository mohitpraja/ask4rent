import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/apptitle.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_outlinebutton.dart';
import 'package:ask4rent/core/widgets/custom_passwordfield.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/custom_scroll.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
        ),
        body: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  commonSpace(),
                  Column(
                    children: const [
                      AppTitle(),
                      Text(
                        'LOG IN TO YOUR ACCOUNT',
                        style: TextStyle(color: lightBlack),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Form(
                      child: Column(
                    children: [
                      const CustomTextFormField(
                        hintText: 'Enter Phone number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      commonSpace(),
                      const CustomPasswordField(
                        hintext: 'Enter Password',
                      ),
                      commonSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(Routes.forgot),
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontFamily: alata),
                            ),
                          ),
                        ],
                      ),
                      commonSpace(),
                      SizedBox(
                        width: Get.width,
                        child: CustomElevatedButton(
                          title: 'Login',
                          onPress: () {
                            Get.toNamed(Routes.dashboard);
                          },
                        ),
                      ),
                      commonSpace(),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Text(
                            '  OR  ',
                            style: TextStyle(
                                color: lightBlack,
                                letterSpacing: 1,
                                fontFamily: alata,
                                fontWeight: FontWeight.normal),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      commonSpace(),
                      CustomOutlineButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 30,
                            ),
                            Text(
                              'Continue with Google',
                              style: TextStyle(fontFamily: alata),
                            )
                          ],
                        ),
                        onPress: () {
                          checkInternet(
                            () {
                              print('login cld');
                            },
                          );
                        },
                      )
                    ],
                  )),
                  SizedBox(height: Get.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not on Ask4rent yet? ',
                        style: TextStyle(color: lightBlack, fontFamily: alata),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.signup),
                        child: Text(
                          'Sign up',
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
