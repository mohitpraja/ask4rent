import 'package:ask4rent/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ask4rent/feature/dashboard/dashboardPages/addProperty/controller/add_property_controller.dart';
import 'package:ask4rent/feature/dashboard/dashboardPages/home/controller/home_controller.dart';
import 'package:ask4rent/feature/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(AddPropertyController());
    Get.put(ProfileController());
  }
}
