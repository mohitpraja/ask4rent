import 'package:ask4rent/feature/editprofile/controller/editprofile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }

}