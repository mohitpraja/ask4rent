import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class AdminHomeController extends GetxController{


  ImagePicker picker = ImagePicker();
  var chartData1;

  @override
  void onInit() async {
    super.onInit();
    chartData1 = getChartData();
  }

  pickImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front, maxHeight: 10);
  }


 List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData("2017", 25),
    SalesData("2018", 35),
    SalesData("2019", 45),
    SalesData("2020", 55),
    SalesData("2021", 65),
  ];
  return chartData;
 }

}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}