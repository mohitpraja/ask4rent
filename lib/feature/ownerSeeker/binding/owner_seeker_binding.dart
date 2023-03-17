import 'package:ask4rent/feature/ownerSeeker/controller/owner_seeker_controller.dart';
import 'package:get/get.dart';

class OwnerSeekerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OwnerSeekerController());
  }
  
}