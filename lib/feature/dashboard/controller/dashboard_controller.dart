import 'package:ask4rent/feature/dashboard/dashboardPages/addProperty/view/add_property_view.dart';
import 'package:ask4rent/feature/dashboard/dashboardPages/home/view/home_view.dart';
import 'package:ask4rent/feature/profile/view/profile_view.dart';
import 'package:ask4rent/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  
  RxInt selectedIndex = 0.obs;
  List<Widget> screens = [
    const HomeView(),
    const AddPropertyView(),
    const SplashView(),
    const ProfileView(),
  ];
}
