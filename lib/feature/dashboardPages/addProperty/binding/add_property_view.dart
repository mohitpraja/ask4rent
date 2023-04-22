import 'package:ask4rent/feature/dashboardPages/addProperty/controller/add_property_controller.dart';
import 'package:get/get.dart';

class AddPropertyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddPropertyController());
  }

}