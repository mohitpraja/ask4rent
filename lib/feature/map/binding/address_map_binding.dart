import 'package:ask4rent/feature/map/controller/address_map_controller.dart';
import 'package:get/get.dart';

class AddressMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddressMapController());
  }
}
