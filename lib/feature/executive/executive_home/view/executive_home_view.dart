import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_drawer.dart';
import 'package:ask4rent/feature/executive/executive_home/controller/executive_home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExecutiveHomeView extends GetView <ExecutiveHomeController>{
  const ExecutiveHomeView({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 60,
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: Get.height * 0.025, fontFamily: alata),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.24,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                         onTap: () => Get.toNamed(Routes.profile),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white54,
                          ),
                          margin: const EdgeInsets.all(8),
                          width: Get.width * 0.9,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userInfo['name']??'',
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
                                      userInfo['post'] ?? 'Executive',
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
                                      imageUrl: userInfo['image']??'',
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
            ),
            Positioned(
              top: Get.height * 0.16,
              child: Container(
                  width: Get.width,
                  height: Get.height * 0.6,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [],
                    ),
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(Routes.addProperty);
          },
          backgroundColor: primaryColor,
          label: Row(
            children: [
              const Icon(Icons.add),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Add Property',
                style: TextStyle(fontFamily: alata),
              )
            ],
          )),
    );
      },
    );

   
  }
}
