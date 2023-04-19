import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/feature/admin_dashboard/home/controller/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'admin',
      ),
      body: Padding(
        padding: EdgeInsets.all(Get.width * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: Get.width * 0.43,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3fd0d0d0),
                          blurRadius: 8,
                          offset: Offset(0, 9),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange),
                              width: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Text("100",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 28)),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.man,
                                  size: 40,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.width * 0.01,
                            ),
                            const Text(
                              "Executives",
                              style: TextStyle(fontSize: 22),
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                    width: Get.width * 0.43,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3fd0d0d0),
                          blurRadius: 8,
                          offset: Offset(0, 9),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // VerticalDivider(
                            //   color: Colors.blue,
                            //   thickness: 8,
                            //   width: 0,
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              width: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Text("100",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 28)),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.house,
                                  size: 40,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.width * 0.01,
                            ),
                            const Text(
                              "Properties",
                              style: TextStyle(fontSize: 22),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3fd0d0d0),
                    blurRadius: 8,
                    offset: Offset(0, 9),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orangeAccent),
                    width: 5,
                  ),
                  SizedBox(
                    width: Get.width * 0.08,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                "owner",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              ),
                              Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            width: 3,
                          ),
                          Column(
                            children: const [
                              Text(
                                "seeker",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              ),
                              Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black54),
                              )
                            ],
                          ),
                          SizedBox(
                           width: Get.width*0.1
                          ),
                          Icon(Icons.people_sharp, size: 60, color: Colors.black54,)
                        ],
                      ),
                      SizedBox(
                        height: Get.width * 0.1,
                      ),
                    const Text(
                        "Total Users : 150",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontSize: 25),
                      ),

                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: Get.width*0.7,
              child: SfCartesianChart(
                  series: <LineSeries<SalesData, dynamic>>[
                    LineSeries<SalesData, dynamic>(
                      // Bind data source
                        dataSource:  controller.chartData1,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales
                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
