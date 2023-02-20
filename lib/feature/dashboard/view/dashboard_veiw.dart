import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/feature/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: controller.screens[controller.selectedIndex.value],
          bottomNavigationBar: WaterDropNavBar(
            selectedIndex: controller.selectedIndex.value,
            onItemSelected: (index) => controller.selectedIndex.value = index,
            backgroundColor: Colors.white,
            waterDropColor: CustomColor.primaryColor,
            inactiveIconColor: Colors.black54,
            iconSize: 30,
            bottomPadding: 20,
            barItems: [
              BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home),
              BarItem(filledIcon: Icons.add, outlinedIcon: Icons.add),
              BarItem(filledIcon: Icons.bookmark, outlinedIcon: Icons.bookmark),
              BarItem(filledIcon: Icons.person, outlinedIcon: Icons.person),
            ],
          ),
        ));
  }
}
