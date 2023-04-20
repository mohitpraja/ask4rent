import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/core/widgets/custom_drawer.dart';
import 'package:ask4rent/feature/admin_dashboard/home/controller/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(fontFamily: alata),
        ),
        titleSpacing: 1,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          commonSpace(),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        Get.toNamed(Routes.addExecutive);
      }, 
      backgroundColor: primaryColor,
      label: Row(children: [
        const Icon(Icons.add),
        const SizedBox(width: 5,),
        Text('Add Execute',style: TextStyle(fontFamily: alata),)
      ],
      )),
    );
  }
}
