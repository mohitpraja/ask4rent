import 'package:ask4rent/feature/executive/executive_home/controller/executive_home_controller.dart';
import 'package:get/get.dart';

class ExecutiveHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ExecutiveHomeController());
  }

}