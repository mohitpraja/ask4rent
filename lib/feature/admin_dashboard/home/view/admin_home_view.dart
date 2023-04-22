import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_drawer.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/feature/admin_dashboard/home/controller/admin_home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.profileStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data?.docs;
          controller.userList = data!.map((e) => e.data()).toList();
          controller.userList.map((e) {
            if (e['id'] == controller.userId) {
              userInfo['name'] = e['name'];
              userInfo['email'] = e['email'];
              userInfo['phone'] = e['phone'];
              userInfo['image'] = e['image'];
              userInfo['id'] = e['id'];
              userInfo['post'] = e['post'];
              if (userInfo['post'] == 'Admin') {
                postStatus.value = '1';
              } else if (userInfo['post'] == 'Executive') {
                postStatus.value = '2';
              } else {
                postStatus.value = '0';
              }
            }
          }).toList();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Dashboard',
              style: TextStyle(fontFamily: alata),
            ),
            titleSpacing: 1,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
            ],
          ),
          drawer: const CustomDrawer(),
          body: ScrollGlowRemover(
            child: Container(
              height: Get.height * 0.8,
              margin: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  commonSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(Routes.profile),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              margin: const EdgeInsets.all(8),
                              width: Get.width * 0.9,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userInfo['name'] ?? '',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: Get.height * 0.025,
                                              fontFamily: alata),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          userInfo['post'] ?? 'Admin',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: Get.height * 0.022,
                                              fontFamily: alata),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: CachedNetworkImage(
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          imageUrl: userInfo['image'] ?? '',
                                          errorWidget: (context, url, error) =>
                                              const CircleAvatar(
                                                  backgroundColor: primaryColor,
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 35,
                                                    color: Colors.white,
                                                  )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  commonSpace(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                const BoxShadow(
                                  offset: Offset(-4, 0),
                                  color: primaryColor,
                                ),
                                BoxShadow(
                                  color: shadowColor,
                                  blurRadius: 8,
                                  offset: const Offset(0, 9),
                                ),
                              ]),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '100',
                                          style: TextStyle(
                                            fontSize: Get.width * 0.065,
                                            fontFamily: alata,
                                          ),
                                        ),
                                        Text(
                                          'Last month : 80',
                                          style: TextStyle(
                                            fontSize: Get.width * 0.035,
                                            fontFamily: alata,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/executive.png',
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Total Executives',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.05,
                                    fontFamily: alata,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                const BoxShadow(
                                  offset: Offset(-4, 0),
                                  color: Colors.green,
                                ),
                                BoxShadow(
                                  color: shadowColor,
                                  blurRadius: 8,
                                  offset: const Offset(0, 9),
                                ),
                              ]),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '100',
                                          style: TextStyle(
                                            fontSize: Get.width * 0.065,
                                            fontFamily: alata,
                                          ),
                                        ),
                                        Text(
                                          'Last month : 80',
                                          style: TextStyle(
                                            fontSize: Get.width * 0.035,
                                            fontFamily: alata,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/house.png',
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Total Properties',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.05,
                                    fontFamily: alata,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  commonSpace(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(-4, 0),
                            color: Colors.teal,
                          ),
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 8,
                            offset: const Offset(0, 9),
                          ),
                        ]),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Owners',
                                        style: TextStyle(
                                          fontSize: Get.width * 0.06,
                                          fontFamily: alata,
                                        ),
                                      ),
                                      Text(
                                        '80',
                                        style: TextStyle(
                                          fontSize: Get.width * 0.05,
                                          fontFamily: alata,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const VerticalDivider(
                                    color: lightBlack,
                                    thickness: 1.5,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Seekers',
                                        style: TextStyle(
                                          fontSize: Get.width * 0.06,
                                          fontFamily: alata,
                                        ),
                                      ),
                                      Text(
                                        '80',
                                        style: TextStyle(
                                          fontSize: Get.width * 0.05,
                                          fontFamily: alata,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      'assets/images/users.png',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: Text(
                              'Total Users : 200',
                              style: TextStyle(
                                fontSize: Get.width * 0.055,
                                fontFamily: alata,
                              ),
                            ),
                          ),
                          commonSpace()
                        ],
                      ),
                    ),
                  ),
                  commonSpace(),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(width: 15, height: 15, color: primaryColor),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Users',
                            style: AppStyle.priceTableStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(width: 15, height: 15, color: Colors.blue),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Properties',
                            style: AppStyle.priceTableStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  commonSpace(),
                  SizedBox(
                      height: 300,
                      child: SfCartesianChart(
                          plotAreaBorderColor: white,
                          margin: const EdgeInsets.all(5),
                          primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(width: 0),
                              axisLine: AxisLine(color: white, width: 0),
                              labelAlignment: LabelAlignment.center,
                              labelStyle: TextStyle(
                                  color: lightBlack,
                                  fontFamily: alata,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.width * 0.035)),
                          // legend: Legend(isVisible: true,textStyle: TextStyle(
                          //         color: lightBlack,
                          //         fontFamily: alata,
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: Get.width * 0.035)),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                isVisibleInLegend: true,
                                legendItemText: 'Users',
                                legendIconType: LegendIconType.rectangle,
                                dataSource: <SalesData>[
                                  SalesData('Jan', 10),
                                  SalesData('Feb', 28),
                                  SalesData('Mar', 15),
                                  SalesData('Apr', 32),
                                  SalesData('May', 40)
                                ],
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales),
                            LineSeries<SalesData, String>(
                                color: primaryColor,
                                isVisibleInLegend: true,
                                legendIconType: LegendIconType.rectangle,
                                legendItemText: 'Properties',
                                dataSource: <SalesData>[
                                  SalesData('Jan', 5),
                                  SalesData('Feb', 15),
                                  SalesData('Mar', 20),
                                  SalesData('Apr', 29),
                                  SalesData('May', 35)
                                ],
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales)
                          ]))
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Get.toNamed(Routes.addExecutive);
              },
              backgroundColor: primaryColor,
              label: Row(
                children: [
                  const Icon(Icons.add),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add Execute',
                    style: TextStyle(fontFamily: alata),
                  )
                ],
              )),
        );
      },
    );
  }
}
