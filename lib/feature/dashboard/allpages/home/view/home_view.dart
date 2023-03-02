import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/widgets/custom_drawer.dart';
import 'package:ask4rent/core/widgets/custom_dropdown.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_textform.dart';
import 'package:ask4rent/core/widgets/customscroll.dart';
import 'package:ask4rent/core/widgets/searchbox.dart';
import 'package:ask4rent/feature/dashboard/allpages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Obx(
          () => Stack(
            children: [
              Scaffold(
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
                          controller.selectCityBox.value = true;
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
                              'Gwalior',
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          size: Get.width * 0.07,
                        )),
                    IconButton(
                        onPressed: () =>
                            controller.scaffoldKey.currentState!.openDrawer(),
                        icon: Icon(
                          Icons.menu,
                          size: Get.width * 0.07,
                        ))
                  ],
                ),
                drawer: const CustomDrawer(),
                body: ScrollConfiguration(
                  behavior: CustomScroll(),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Popular localities in',
                                    style: AppStyle.popularLocality,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Gwalior',
                                    style: AppStyle.popularLocalityOrange,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              SizedBox(
                                height: 230,
                                child: ScrollConfiguration(
                                  behavior: CustomScroll(),
                                  child: ListView.builder(
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(10),
                                        width: Get.width * 0.55,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: const Border.fromBorderSide(
                                                BorderSide(
                                                    color: primaryColor))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Text(
                                                'City Center',
                                                textAlign: TextAlign.center,
                                                style: AppStyle.cityTitle,
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.015,
                                              ),
                                              Text(
                                                '10+',
                                                style: AppStyle.cityTitle,
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Text(
                                                'Properties for \n rent',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Get.width * 0.05,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: alata,
                                                    color: lightBlack),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              SizedBox(
                                                width: Get.width,
                                                child: CustomElevatedButton(
                                                  title: 'Explore',
                                                  onPress: () {},
                                                ),
                                              )
                                            ],
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
                                          onChanged: (p0) {},
                                          borderColor: Colors.grey,
                                          hintText: 'Select City',
                                          boxCornerRadius: 0,
                                          borderRadius: 0,
                                          hinTextStyle: TextStyle(
                                            fontSize: Get.width * 0.04,
                                            fontFamily: josefin,
                                            color: Colors.black,
                                          ),
                                          items: controller.cities.map(
                                            (value) {
                                              return DropdownMenuItem<String>(
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
                                SizedBox(
                                  height: commonSpace,
                                ),
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
                                SizedBox(
                                  height: commonSpace,
                                ),
                                ScrollConfiguration(
                                    behavior: CustomScroll(),
                                    child: Expanded(
                                      child: GridView.count(
                                          crossAxisCount: 4,
                                          childAspectRatio: 8.0 / 3.0,
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 10.0,
                                          // Generate 100 widgets that display their index in the List.
                                          children: List.generate(10, (index) {
                                            return Container(
                                              alignment: Alignment.center,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              child: Text(
                                                'Demo',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: josefin),
                                              ),
                                            );
                                          })),
                                    ))
                              ]),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.selectCityBox.value,
                child: SafeArea(
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        margin: const EdgeInsets.symmetric(
                            vertical: 70, horizontal: 0),
                        child: SizedBox(
                            height: 200,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Column(children: [
                                Container(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: IconButton(
                                      onPressed: () => controller
                                          .selectCityBox.value = false,
                                      icon: const Icon(Icons.close)),
                                ),
                                SizedBox(
                                  height: commonSpace,
                                ),
                                ScrollConfiguration(
                                    behavior: CustomScroll(),
                                    child: Expanded(
                                      child: GridView.count(
                                          crossAxisCount: 4,
                                          childAspectRatio: 8.0 / 3.0,
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 5.0,
                                          // Generate 100 widgets that display their index in the List.
                                          children: List.generate(10, (index) {
                                            return Container(
                                              alignment: Alignment.center,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              child: Text(
                                                'Demo',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: josefin),
                                              ),
                                            );
                                          })),
                                    ))
                              ]),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
