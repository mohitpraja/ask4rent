// var userId='';
import 'package:get/get.dart';

RxMap userInfo = {}.obs;
RxString currLocation = ''.obs;
RxString currAddress=''.obs;
RxList localitiesByCity = [].obs;
RxBool isInternet=false.obs;
List propertyImagesUrls = [];