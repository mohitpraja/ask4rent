import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/widgets/card_component.dart';
import 'package:ask4rent/feature/ownerSeeker/owner/controller/owner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerView extends GetView<OwnerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "My Properties & responses",
                    style: TextStyle(
                        fontFamily: alata,
                        fontSize: Get.width * 0.05,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
                child: CardComponent(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                CupertinoIcons.home,
                                color: Colors.grey,
                                size: Get.width * 0.1,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: Get.width * 0.07,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            "Properties",
                            style: TextStyle(
                                fontSize: Get.width * 0.042,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),

                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.042,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Active",
                            style: TextStyle(
                                fontSize: Get.width * 0.04,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: Get.width*0.015,),
                          Text(
                            "Inactive",
                            style: TextStyle(
                                fontSize: Get.width * 0.04,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: Get.width * 0.04,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: Get.width*0.015,),
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: Get.width * 0.04,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
            Expanded(
                child: CardComponent(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    CupertinoIcons.mail_solid,
                                    color: Colors.grey,
                                    size: Get.width * 0.1,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: Get.width * 0.07,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                "Responses",
                                style: TextStyle(
                                    fontSize: Get.width * 0.042,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),

                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.width * 0.042,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: Get.width*0.015,),
                              Text(
                                "Last 7 days",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: Get.width*0.015,),
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
                child: CardComponent(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.grey,
                                    size: Get.width * 0.1,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: Get.width * 0.07,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                "Site Visits",
                                style: TextStyle(
                                    fontSize: Get.width * 0.042,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),

                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.width * 0.042,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Scheduled",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: Get.width*0.015,),
                              Text(
                                "Cancelled",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: Get.width*0.015,),
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
