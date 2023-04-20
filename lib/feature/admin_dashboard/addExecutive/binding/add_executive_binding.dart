import 'package:ask4rent/feature/admin_dashboard/addExecutive/controller/add_executive_controller.dart';
import 'package:get/get.dart';

class AddExecutiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddExecutiveController());
  }

}