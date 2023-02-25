import 'package:ask4rent/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ask4rent/feature/dashboard/allpages/home/controller/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
  }
}
