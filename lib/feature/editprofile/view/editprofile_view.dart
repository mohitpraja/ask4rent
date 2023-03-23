import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/validation.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/feature/editprofile/controller/editprofile_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Edit Profile',showBackButton: true,),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: controller.editProfileFormKey,
            child: Column(children: [
              commonSpace(),
              Row(
                children: [
                  const Icon(CupertinoIcons.person, color: lightBlack),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name', style: TextStyle(fontFamily: alata)),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofocus: true,
                          style:
                              TextStyle(color: lightBlack, fontFamily: ubuntu),
                          decoration: InputDecoration(
                              hintText: 'Enter full name',
                              hintStyle: TextStyle(
                                  color: lightBlack, fontFamily: ubuntu),
                              contentPadding: EdgeInsets.zero),
                          controller: controller.name,
                          validator: (value) => nameValidator(value),
                        )
                      ],
                    ),
                  )
                ],
              ),
              commonSpace(),
              Row(
                children: [
                  const Icon(CupertinoIcons.mail, color: lightBlack),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email Address',
                            style: TextStyle(fontFamily: alata)),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style:
                              TextStyle(color: lightBlack, fontFamily: ubuntu),
                          decoration: InputDecoration(
                              hintText: 'Enter email address',
                              hintStyle: TextStyle(
                                  color: lightBlack, fontFamily: ubuntu),
                              contentPadding: EdgeInsets.zero),
                          controller: controller.email,
                          validator: (value) => emailValidator(value),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SizedBox(
                width: Get.width,
                child: CustomElevatedButton(
                  title: 'Update',
                  onPress: () {
                    if (controller.editProfileFormKey.currentState!
                        .validate()) {
                      checkInternet(() {
                        CustomLoader(title: 'Updating Profile').loader();

                        Fbase.updateUserInfo(userInfo['id'],
                                controller.name.text, controller.email.text)
                            .then((value) {
                               Get.back();
                          CustomDialog(
                                  btnOkOnPress: () {
                                    Get.back();
                                    Get.back();
                                  },
                                  isDismissable: false,
                                  descText: 'Details Updated')
                              .success();
                        });
                      });
                    }
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
