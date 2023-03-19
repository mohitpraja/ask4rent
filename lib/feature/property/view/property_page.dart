import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/searchbox.dart';
import 'package:ask4rent/feature/property/controller/property_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PropertyPage extends GetView<PropertyController> {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 30)),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'A',
              style: TextStyle(
                  fontFamily: pacifico,
                  color: primaryColor,
                  fontSize: Get.width * 0.06),
            ),
            Text(
              'skforRent',
              style: TextStyle(
                  fontFamily: pacifico,
                  fontSize: Get.width * 0.06,
                  color: Colors.black),
            ),
          ],
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.locationDot,
                size: Get.width * 0.045,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Gwalior',
                style: AppStyle.appCityGrey,
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {},
                child: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Get.width * 0.045,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchField(
              textInputType: TextInputType.none,
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Sort by',
                style: AppStyle.sortBy,
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {},
                child: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Get.width * 0.045,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 3),
                itemCount: controller.houseImage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.95,
                              height: Get.height * 0.6,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                      width: Get.width * 0.9,
                                      height: Get.width * 0.6,
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            controller.houseImage[index]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: Get.width * 0.04),
                                      Text("1 BHK house for rent in Gwalior",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Get.width * 0.045)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.025,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: Get.width * 0.04),
                                      const Text("Post on : 22-09-2022",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.width * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: Get.width * 0.055),
                                      Column(
                                        children: [
                                          Text("₹ 1200 ",
                                              style: TextStyle(
                                                  fontSize: Get.width * 0.06,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepOrange)),
                                          Text("per month",
                                              style: TextStyle(
                                                fontSize: Get.width * 0.035,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.045,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.3,
                                        height: Get.width* 0.1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                                            border: Border.all(color: Colors.grey,
                                            width: 1.5)
                                          ),
                                          child: CustomElevatedButton(
                                            bgColor: Colors.white,
                                            padding: 0,
                                            textStyle: TextStyle(
                                                color: Colors.black54,
                                                fontSize: Get.width * 0.03),
                                            title: "Schedule visit",
                                            onPress: () {},
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.3,
                                        child: CustomElevatedButton(
                                          padding: 0,
                                          textStyle: TextStyle(
                                              fontSize: Get.width * 0.03,
                                              color: Colors.white),
                                          title: "Contact owner",
                                          onPress: () {},
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: Get.width * 0.035),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text("Read more..."),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: Get.width * 0.025,
                      left: Get.width * 0.7,
                      child: Container(
                        height: Get.width * 0.1,
                        width: Get.width * 0.3,
                        color: Colors.deepOrange,
                        child: const Center(
                          child: Text(
                            "Verified",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    )),
          )
        ],
      ),
    );
  }
}
