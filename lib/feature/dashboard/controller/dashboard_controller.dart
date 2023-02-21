import 'package:ask4rent/feature/dashboard/home/view/home_view.dart';
import 'package:ask4rent/feature/login/view/login_view.dart';
import 'package:ask4rent/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  
  RxInt selectedIndex = 0.obs;
  List<Widget> screens = [
    const HomeView(),
    const LoginView(),
    const SplashView(),
    const SplashView(),
  ];
}