import 'package:get/get.dart';

class PropertyDetailController extends GetxController {
  Map propertyDetails = {};
  
  @override
  void onInit() {
    propertyDetails = Get.arguments;
    super.onInit();
  }
}
