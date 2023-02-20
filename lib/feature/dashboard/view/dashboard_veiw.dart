import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/feature/dashboard/controller/dashboard_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: controller.screens[controller.selectedIndex.value],
          bottomNavigationBar: ConvexAppBar(
              backgroundColor: CustomColor.primaryColor,
              height: 60,
              onTap: (index) => controller.selectedIndex.value = index,
              items: const [
                TabItem(
                  icon: Icons.home,
                ),
                TabItem(
                  icon: Icons.add,
                ),
                TabItem(
                  icon: Icons.bookmark,
                ),
                TabItem(icon: CupertinoIcons.person),
              ]),
        ));
  }
}
