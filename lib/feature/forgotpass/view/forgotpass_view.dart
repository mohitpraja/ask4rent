import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/validation.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/apptitle.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/core/widgets/custom_passwordfield.dart';
import 'package:ask4rent/feature/forgotpass/controller/forgotpass_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassView extends GetView<ForgotPassController> {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppTitle(),
              const Text(
                'reset your account password',
                style: TextStyle(color: lightBlack),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Form(
                  key: controller.forgotPassFormKey,
                  child: Column(
                    children: [
                      CustomPasswordField(
                        controller: controller.password,
                        validator: (p0) => passwordValidator(p0),
                      ),
                      SizedBox(
                        height: Get.height * 0.035,
                      ),
                      CustomPasswordField(
                        hintext: 'Confirm Password',
                        validator: (p0) => confirmPasswordValidator(
                            p0, controller.password.text),
                      ),
                      SizedBox(
                        height: Get.height * 0.035,
                      ),
                      CustomElevatedButton(
                        title: 'Reset Password',
                        onPress: () {
                          if (controller.forgotPassFormKey.currentState!
                              .validate()) {
                            CustomLoader().loader();
                            Fbase.forgotPass(
                                    controller.phone, controller.password.text)
                                .then((value) {
                              Get.back();
                              CustomDialog(
                                descText: 'Password reset successfully',
                                isDismissable: false,
                                btnOkOnPress: () =>
                                    Get.offAllNamed(Routes.login),
                              ).success();
                            });
                          }
                        },
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
