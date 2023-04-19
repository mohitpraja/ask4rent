import 'package:ask4rent/feature/savedProperty/controller/saved_property_controller.dart';
import 'package:get/get.dart';

class SavedPropertyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SavedPropertyController());
  }

}