import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/validation.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/core/widgets/custom_passwordfield.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/feature/admin_dashboard/addExecutive/controller/add_executive_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExecutiveView extends GetView<AddExecutiveController> {
  const AddExecutiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: const CustomAppBar(
          title: "Add Executive",
          showBackButton: true,
        ),
        body: ScrollGlowRemover(
          child: SingleChildScrollView(
            child: Obx(() => Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                          key: controller.addExecutiveFormKey,
                          child: Column(
                            children: [
                              commonSpace(),
                              commonSpace(),
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey.shade100,
                                backgroundImage:
                                    AssetImage('assets/images/executive.png'),
                              ),
                               commonSpace(),
                               commonSpace(),
                              CustomTextFormField(
                                hintText: 'Enter Name',
                                prefixIcon: const Icon(Icons.person),
                                validator: (p0) => nameValidator(p0),
                                controller: controller.nameController,
                              ),
                              commonSpace(),
                              CustomTextFormField(
                                hintText: 'Enter Email',
                                inputType: TextInputType.emailAddress,
                                prefixIcon: const Icon(Icons.email),
                                validator: (p0) => emailValidator(p0),
                                controller: controller.emailController,
                                onchanged: (p0) {
                                  Fbase.isEmailExist.value = false;
                                },
                              ),
                              Fbase.isEmailExist.value
                                  ? Column(
                                      children: [
                                        commonSpace1(),
                                        Row(
                                          children: const [
                                            Text(
                                              'Email already existed',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        commonSpace1()
                                      ],
                                    )
                                  : const SizedBox(),
                              Fbase.isEmailExist.value
                                  ? const SizedBox()
                                  : commonSpace(),
                              CustomTextFormField(
                                hintText: 'Enter Phone',
                                inputType: TextInputType.number,
                                maxLength: 10,
                                prefixIcon: const Icon(Icons.phone),
                                validator: (p0) => phoneValidator(p0),
                                controller: controller.phoneController,
                                onchanged: (value) {
                                  Fbase.isPhoneExist.value = false;
                                },
                              ),
                              Fbase.isPhoneExist.value
                                  ? Column(
                                      children: [
                                        commonSpace1(),
                                        Row(
                                          children: const [
                                            Text(
                                              'Phone number already existed',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        commonSpace1()
                                      ],
                                    )
                                  : const SizedBox(),
                              Fbase.isPhoneExist.value
                                  ? const SizedBox()
                                  : commonSpace(),
                              CustomPasswordField(
                                validator: (p0) => passwordValidator(p0),
                                controller: controller.passwordController,
                              ),
                              // commonSpace(),
                              // CustomPasswordField(
                              //   hintext: 'Confirm Password',
                              //   validator: (p0) => confirmPasswordValidator(
                              //       p0, controller.passwordController.text),
                              // ),
                              commonSpace(),
                              SizedBox(
                                width: Get.width,
                                child: CustomElevatedButton(
                                  title: 'Add',
                                  onPress: () {
                                    Fbase.isPhoneExist.value = false;
                                    Fbase.isEmailExist.value = false;
                                    if (controller
                                        .addExecutiveFormKey.currentState!
                                        .validate()) {
                                      Get.focusScope!.unfocus;
                                      checkInternet(() {
                                        Fbase.checkUser(
                                                controller.phoneController.text,
                                                controller.emailController.text)
                                            .then((value) {
                                          if (!(Fbase.isPhoneExist.value) &&
                                              !(Fbase.isEmailExist.value)) {
                                            CustomLoader().loader();
                                            Fbase.createUser(
                                              controller.nameController.text,
                                              controller.emailController.text,
                                              controller
                                                  .passwordController.text,
                                              controller.phoneController.text,
                                              'Executive',
                                            ).then((value) {CustomDialog(
                                                  isDismissable: false,
                                                  btnOkOnPress: () =>
                                                      Get.offAllNamed(
                                                          Routes.adminHome),
                                                ).success();});
                                          }
                                        });
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
