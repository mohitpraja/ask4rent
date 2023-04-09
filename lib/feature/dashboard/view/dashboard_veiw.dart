import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/nointernet.dart';
import 'package:ask4rent/feature/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:ask4rent/core/global/global_var.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => isInternet.value
        ? NoInternet(
            onTryAgain: () => Get.offAllNamed(Routes.dashboard),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: controller.screens[controller.selectedIndex.value],
            bottomNavigationBar: Container(
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        0.0,
                        -5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: -5.0,
                    ), //
                  ]),
              child: WaterDropNavBar(
                selectedIndex: controller.selectedIndex.value,
                onItemSelected: (index) =>
                    controller.selectedIndex.value = index,
                backgroundColor: white,
                waterDropColor: primaryColor,
                bottomPadding: 15,
                inactiveIconColor: lightBlack,
                iconSize: 30,
                barItems: [
                  BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home),
                  BarItem(filledIcon: Icons.add, outlinedIcon: Icons.add),
                  BarItem(
                      filledIcon: Icons.bookmark,outlinedIcon: Icons.bookmark),
                  BarItem(filledIcon: Icons.person, outlinedIcon: Icons.person),
                ],
              ),
            ),
          ));
  }
}
