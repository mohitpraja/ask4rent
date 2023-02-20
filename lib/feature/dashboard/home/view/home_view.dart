import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
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
      drawer: const Drawer(),
      body: Container(
        height: Get.height*0.09,
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.07,
              height: Get.width * 0.07,
              color: CustomColor.primaryColor,
            ),
            Text('Renting made easy',style: AppStyle.rentingMadeEasy),
            const SizedBox(height: 5,),
             Text('Easiest way to find & rent your home online.',style:AppStyle.subheading)
          ],
        ),
      ),
    );
  }
}
