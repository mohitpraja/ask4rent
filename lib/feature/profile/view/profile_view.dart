import 'dart:developer';
import 'dart:io';
import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/card_component.dart';
import 'package:ask4rent/feature/profile/controller/profile_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView <ProfileController>{
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    log('is id : ${userInfo['id']}');
    return StreamBuilder(
        stream: Fbase.profileStream(userInfo['id']),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            userInfo['name'] = data!['name'];
            userInfo['email'] = data['email'];
            userInfo['phone'] = data['phone'];
            userInfo['image'] = data['image'];
          }
          return Scaffold(
              body:SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 0.35,
                    color: primaryColor,
                    
                    child: Center(
                      child: controller.imagePath.value != ''
                            ? Container(
                              decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(
                                BorderSide(color: white, width: 3))),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(75),
                                    child: Image.file(
                                      File(controller.imagePath.value),
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            )
                            : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(
                                BorderSide(color: white, width: 3))),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: CachedNetworkImage(
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              imageUrl: userInfo['image'],
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                backgroundColor: Colors.indigo.shade100,
                                backgroundImage: const AssetImage(
                                    'assets/images/person.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: Get.height * 0.3,
                      child: SizedBox(
                        width: Get.width * 0.95,
                        child: CardComponent(
                          outerPadding: EdgeInsets.zero,
                          innerPadding: const EdgeInsets.all(5),
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Personal Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: alata,
                                          fontSize: Get.width * 0.055),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.toNamed(Routes.editProfile);
                                            },
                                            child: const Icon(Icons.edit)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.choosePic();
                                          },
                                          child: const Icon(CupertinoIcons.camera)),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  userInfo['name'],
                                  style: TextStyle(
                                      fontSize: Get.width * 0.05,
                                      fontFamily: alata),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  userInfo['phone'],
                                  style: TextStyle(
                                      fontSize: Get.width * 0.045,
                                      fontFamily: josefin),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  userInfo['email'],
                                  style: TextStyle(
                                      fontSize: Get.width * 0.045,
                                      fontFamily: josefin),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
