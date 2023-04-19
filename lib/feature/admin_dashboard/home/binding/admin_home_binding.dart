import 'package:ask4rent/feature/admin_dashboard/home/controller/admin_home_controller.dart';
import 'package:get/get.dart';

class AdminHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminHomeController());
  }

}