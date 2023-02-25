import 'package:get/get.dart';
var commonSpace=Get.height * 0.015;
RxBool isPass = true.obs;
showPass() {
  if (isPass.value == true) {
    isPass.value = false;
  } else {
    isPass.value = true;
  }
}
