import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/feature/dashboardPages/addProperty/view/add_property_view.dart';
import 'package:ask4rent/feature/dashboardPages/home/view/home_view.dart';
import 'package:ask4rent/feature/profile/view/profile_view.dart';
import 'package:ask4rent/feature/property/view/property_page.dart';
import 'package:ask4rent/feature/savedProperty/view/saved_property_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DashboardController extends GetxController {
  @override
  Future<void> onInit() async {
    if (!(await InternetConnectionChecker().hasConnection)) {
      isInternet.value = true;
    } else {
      isInternet.value = false;
    }
    super.onInit();
  }

  RxInt selectedIndex = 0.obs;
  List<Widget> screens = [
    const HomeView(),
    const AddPropertyView(),
    const SavedPropertyView(),
    const ProfileView(),
  ];
}
