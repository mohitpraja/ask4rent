import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/apptitle.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_outlinebutton.dart';
import 'package:ask4rent/core/widgets/custom_passwordfield.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
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
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppTitle(),
              const Text(
                'LOG IN TO YOUR ACCOUNT',
                style: TextStyle(color: lightBlack),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Form(
                  child: Column(
                children: [
                  const CustomTextFormField(
                    hintText: 'Enter Phone number',
                    preficIcon: Icon(Icons.phone),
                  ),
                  SizedBox(height: commonSpace),
                  const CustomPasswordField(
                    hintext: 'Enter Password',
                  ),
                  SizedBox(height: commonSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: alata),
                      ),
                    ],
                  ),
                  SizedBox(height: commonSpace),
                  SizedBox(
                    width: Get.width,
                    child: CustomElevatedButton(
                      title: 'Login',
                      onPress: () {
                        Get.toNamed(Routes.dashboard);
                      },
                    ),
                  ),
                  SizedBox(height: commonSpace),
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
                  SizedBox(height: commonSpace),
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
                    onPress: () {},
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
