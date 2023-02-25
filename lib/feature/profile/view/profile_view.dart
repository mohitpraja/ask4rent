import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: Get.width,
              color: primaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
                child: CircleAvatar(
                  radius: Get.width * 0.15,
                  backgroundColor: primaryShade2,
                  child: Icon(
                    Icons.person,
                    size: Get.width * 0.15,
                    color: white,
                  ),
                ),
              ),
            ),
            Positioned(
                top: Get.height * 0.3,
                child: SizedBox(
                  width: Get.width * 0.95,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Personal Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: alata,
                                    fontSize: Get.width * 0.055),
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.edit),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(CupertinoIcons.camera),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your Name',
                            style: TextStyle(
                                fontSize: Get.width * 0.05, fontFamily: lato),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '123456790',
                            style: TextStyle(
                                fontSize: Get.width * 0.04, fontFamily: lato),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'abc@gmail.com',
                            style: TextStyle(
                                fontSize: Get.width * 0.04, fontFamily: lato),
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
  }
}
