import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/widgets/custom_drawer.dart';
import 'package:ask4rent/core/widgets/custombutton.dart';
import 'package:ask4rent/core/widgets/customscroll.dart';
import 'package:ask4rent/core/widgets/searchbox.dart';
import 'package:ask4rent/feature/dashboard/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: controller.scaffoldKey,
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              'AskforRent',
              style: AppStyle.appTitile,
            ),
            InkWell(
              onTap: () {},
              child: Row(
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
                    style: AppStyle.appCity,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FaIcon(
                    FontAwesomeIcons.chevronDown,
                    size: Get.width * 0.035,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: Get.width * 0.07,
              )),
          IconButton(
              onPressed: () =>
                  controller.scaffoldKey.currentState!.openDrawer(),
              icon: Icon(
                Icons.menu,
                size: Get.width * 0.07,
              ))
        ],
      ),
      drawer: const CustomDrawer(),
      body: ScrollConfiguration(
        behavior: CustomScroll(),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.7,
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.07,
                  height: Get.width * 0.07,
                  color: primaryColor,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Renting made easy', style: AppStyle.rentingMadeEasy),
                    const SizedBox(height: 5),
                    Text('Easiest way to find & rent your home online.',
                        style: AppStyle.subheading),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SearchField(),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular localities in',
                      style: AppStyle.popularLocality,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Gwalior',
                      style: AppStyle.popularLocalityOrange,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CustomScroll(),
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          width: Get.width * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: const Border.fromBorderSide(
                                  BorderSide(color: primaryColor))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  'City Center',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.cityTitle,
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  '10+',
                                  style: AppStyle.cityTitle,
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  'Properties for \n rent',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Get.width * 0.05,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: alata,
                                      color: lightBlack),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                SizedBox(
                                  width: Get.width,
                                  child: CustomButton(
                                    title: 'Explore',
                                    onPress: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
