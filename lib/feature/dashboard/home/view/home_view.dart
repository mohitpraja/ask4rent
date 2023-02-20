import 'package:ask4rent/core/global/colors.dart';
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
      key: controller.scaffoldKey,
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        toolbarHeight: 60,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                size: Get.width * 0.08,
              )),
          IconButton(
              onPressed: () =>
                  controller.scaffoldKey.currentState!.openDrawer(),
              icon: Icon(
                Icons.menu,
                size: Get.width * 0.08,
              ))
        ],
      ),
      drawer: const Drawer(),
      // body: Container(
      //   margin: const EdgeInsets.all(15),
      //   child: Column(
      //     children: [
      //       Container(
      //         width: 30,
      //         height: 30,
      //         color: CustomColor.primaryColor,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
