import 'dart:developer';

import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/localDB/cities.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/custom_drawer.dart';
import 'package:ask4rent/core/widgets/custom_dropdown.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/core/widgets/searchbox.dart';
import 'package:ask4rent/feature/dashboardPages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
        return GestureDetector(
            onTap: () => Get.focusScope!.unfocus(),
            child: Obx(
              () => Stack(
                children: [
                  Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: Colors.white,
                    key: controller.scaffoldKey,
                    appBar: AppBar(
                      leading: const SizedBox(),
                      leadingWidth: 0,
                      toolbarHeight: 70,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'AskforRent',
                            style: AppStyle.appTitile,
                          ),
                          InkWell(
                            onTap: () {
                              controller.searchCity();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  size: Get.width * 0.045,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  currLocation.value == ''
                                      ? 'Loading...'
                                      : currLocation.value,
                                  style: AppStyle.appCity,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: Get.width * 0.035,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {
                              // controller.getCurrentPosition();
                              log(currAddress.value);
                              List word = currAddress.split(',');
                              log('word :$word');
                            },
                            icon: Icon(
                              Icons.notifications,
                              size: Get.width * 0.07,
                            )),
                        IconButton(
                            onPressed: () => controller
                                .scaffoldKey.currentState!
                                .openDrawer(),
                            icon: Icon(
                              Icons.menu,
                              size: Get.width * 0.07,
                            ))
                      ],
                    ),
                    drawer: const CustomDrawer(),
                    body: ScrollGlowRemover(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Get.width * 0.07,
                                    height: Get.width * 0.07,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Renting made easy',
                                          style: AppStyle.rentingMadeEasy),
                                      const SizedBox(height: 5),
                                      Text(
                                          'Easiest way to find & rent your home online.',
                                          style: AppStyle.subheading),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  CustomSearchField(
                                    textInputType: TextInputType.none,
                                    onTap: () {
                                      controller.isSearch.value = true;
                                    },
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Popular localities in',
                                        style: AppStyle.popularLocality,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        currLocation.value == ''
                                            ? 'Loading...'
                                            : currLocation.value,
                                        style: AppStyle.popularLocalityOrange,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  SizedBox(
                                    height: 250,
                                    child: ScrollGlowRemover(
                                      child: ListView.builder(
                                        itemCount: controller.isLoader.value
                                            ? 10
                                            : localitiesByCity.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return controller.isLoader.value
                                              ? Shimmer.fromColors(
                                                  baseColor:
                                                      const Color(0xFFEBEBF4),
                                                  highlightColor:
                                                      const Color(0xFFF4F4F4),
                                                  child: Container(
                                                    height: 250,
                                                    width: Get.width * 0.51,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                )
                                              : localitiesByCity[index].isEmpty
                                                  ? Container(
                                                      color: primaryColor,
                                                      width: 30,
                                                      height: 20,
                                                    )
                                                  : localitiesByCity[index]
                                                              ['city'] ==
                                                          ''
                                                      ? Container(
                                                          height: 250,
                                                          width:
                                                              Get.width * 0.4,
                                                          decoration:
                                                              BoxDecoration(
                                                            backgroundBlendMode:
                                                                BlendMode
                                                                    .darken,
                                                            gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                  primaryColor
                                                                      .withOpacity(
                                                                          0.8),
                                                                  Colors.grey
                                                                      .withOpacity(
                                                                          0.7)
                                                                ]),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Show all Properties in ${currLocation.value == '' ? 'Loading...' : currLocation.value}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  color: white,
                                                                  fontSize:
                                                                      Get.width *
                                                                          0.04,
                                                                  fontFamily:
                                                                      alata,
                                                                ),
                                                              ),
                                                              commonSpace1(),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        width:
                                                                            2,
                                                                        color:
                                                                            white)),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(3),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      white,
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .arrow_right_alt,
                                                                    size: 20,
                                                                    color:
                                                                        lightBlack,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : 
                                                      Container(
                                                          height: 250,
                                                          width:
                                                              Get.width * 0.51,
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  localitiesByCity[
                                                                          index]
                                                                      [
                                                                      'image']),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              backgroundBlendMode:
                                                                  BlendMode
                                                                      .darken,
                                                              gradient: localitiesByCity[
                                                                              index]
                                                                          [
                                                                          'image'] ==
                                                                      ''
                                                                  ? LinearGradient(
                                                                      colors: [
                                                                          primaryColor,
                                                                          primaryShade1
                                                                        ])
                                                                  : LinearGradient(
                                                                      colors: [
                                                                          Colors
                                                                              .black54
                                                                              .withOpacity(0.6),
                                                                          Colors
                                                                              .black38
                                                                              .withOpacity(0.7)
                                                                        ]),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    localitiesByCity[
                                                                            index]
                                                                        [
                                                                        'city'],
                                                                    style: TextStyle(
                                                                        color:
                                                                            white,
                                                                        height:
                                                                            1.1,
                                                                        fontFamily:
                                                                            alata,
                                                                        fontSize:
                                                                            Get.width *
                                                                                0.06),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                      localitiesByCity[index]
                                                                          [
                                                                          'description'],
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          3,
                                                                      style: TextStyle(
                                                                          color:
                                                                              white,
                                                                          fontFamily:
                                                                              ubuntu,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              Get.width * 0.035)),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    child:
                                                                        CustomElevatedButton(
                                                                      onPress:
                                                                          () {
                                                                        Get.toNamed(
                                                                            Routes.property,
                                                                            arguments: [
                                                                              {
                                                                                'locality': localitiesByCity[index]['city']
                                                                              }
                                                                            ]);
                                                                      },
                                                                      title:
                                                                          'Explore',
                                                                      bgColor:
                                                                          white,
                                                                      textColor:
                                                                          primaryColor,
                                                                      padding:
                                                                          0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                        
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isSearch.value,
                    child: SafeArea(
                      child: Container(
                        color: Colors.black.withOpacity(0.75),
                        height: Get.height,
                        child: Column(
                          children: [
                            Container(
                                height: 350,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: white,
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: primaryColor, width: 5))),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Column(children: [
                                    Container(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: IconButton(
                                          onPressed: () =>
                                              controller.isSearch.value = false,
                                          icon: const Icon(Icons.close)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Where in',
                                          style: AppStyle.search,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          width: Get.width * 0.35,
                                          height: 35,
                                          child: CustomDropDown(
                                              onChanged: (p0) {
                                                currLocation.value = p0!;
                                                controller.setLoclity();

                                                controller.isSearch.value =
                                                    false;
                                              },
                                              borderColor: Colors.grey,
                                              hintText: currLocation.value == ''
                                                  ? 'Select City'
                                                  : currLocation.value,
                                              boxCornerRadius: 0,
                                              value: currLocation.value,
                                              borderRadius: 0,
                                              hinTextStyle: TextStyle(
                                                fontSize: Get.width * 0.04,
                                                fontFamily: josefin,
                                                color: Colors.black,
                                              ),
                                              items: cities.map(
                                                (value) {
                                                  return DropdownMenuItem<
                                                          String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: AppStyle.search,
                                                      ));
                                                },
                                              ).toList()),
                                        ),
                                        Text('do you want to live',
                                            style: AppStyle.search)
                                      ],
                                    ),
                                    commonSpace(),
                                    CustomTextFormField(
                                      hintText: 'Enter location',
                                      borderRadius: 0,
                                      borderColor: lightBlack,
                                      suffixIcon: CustomElevatedButton(
                                        title: 'Search',
                                        borderRadius: 0,
                                        onPress: () {},
                                      ),
                                    ),
                                    commonSpace(),
                                    ScrollGlowRemover(
                                      child: Expanded(
                                        child: GridView.count(
                                            crossAxisCount: 3,
                                            childAspectRatio: 8.0 / 3.0,
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 10.0,
                                            children: List.generate(
                                                localitiesByCity.length,
                                                (index) {
                                              return Container(
                                                alignment: Alignment.center,
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                child: Text(
                                                  localitiesByCity[index]
                                                      ['city'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: josefin),
                                                ),
                                              );
                                            })),
                                      ),
                                    )
                                  ]),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
