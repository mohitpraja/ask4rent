import 'package:ask4rent/feature/propertyDetail/controller/property_detail_controller.dart';
import 'package:get/get.dart';

class PropertyDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PropertyDetailController());
  }


}