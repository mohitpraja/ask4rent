import 'package:ask4rent/feature/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }

}