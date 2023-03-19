import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/widgets/card_component.dart';
import 'package:ask4rent/feature/ownerseekpages/seeker/controller/seeker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SeekerView extends GetView<SeekerViewController> {
  const SeekerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your home journey",
                  style: TextStyle(
                      fontFamily: alata,
                      fontSize: Get.width * 0.05,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          CardComponent(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              color: Colors.grey,
                              size: Get.width * 0.1,
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.03,
                        ),
                        Text(
                          "Search Properties",
                          style: TextStyle(
                              fontSize: Get.width * 0.042,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          CardComponent(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: Colors.grey,
                              size: Get.width * 0.1,
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.03,
                        ),
                        Text(
                          "Saved Properties",
                          style: TextStyle(
                              fontSize: Get.width * 0.042,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          CardComponent(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              FontAwesomeIcons.car,
                              color: Colors.grey,
                              size: Get.width * 0.1,
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.width * 0.03,
                        ),
                        Text(
                          "Site Visits",
                          style: TextStyle(
                              fontSize: Get.width * 0.042,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
