import 'package:ask4rent/feature/property/controller/property_controller.dart';
import 'package:get/get.dart';

class PropertyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PropertyController());
  }

}