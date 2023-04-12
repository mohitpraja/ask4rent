// var userId='';
import 'package:ask4rent/core/widgets/logger/logger.dart';
import 'package:get/get.dart';

RxMap userInfo = {}.obs;
RxString currLocation = ''.obs;
RxString currAddress = ''.obs;
RxList localitiesByCity = [].obs;
RxBool isInternet = false.obs;
List<String>? propertyImagesUrls = [];
var logger = Logger();
