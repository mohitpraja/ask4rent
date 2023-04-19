
import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:ask4rent/core/widgets/card_component.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/custom_white_appbar.dart';
import 'package:ask4rent/core/widgets/searchbox.dart';
import 'package:ask4rent/feature/property/controller/property_controller.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PropertyPage extends GetView<PropertyController> {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CustomWhiteAppBar(
        height: 35,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Properties in ${controller.localCity.value}',
                style: TextStyle(
                    fontSize: Get.width * 0.07,
                    fontFamily: ubuntu,
                    fontWeight: FontWeight.bold)),
            commonSpace(),
            CustomSearchField(
              hintText: 'Search...',
              textInputType: TextInputType.none,
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Sort by',
                  style: AppStyle.sortBy,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {},
                  child: FaIcon(
                    FontAwesomeIcons.chevronDown,
                    size: Get.width * 0.045,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            commonSpace(),
            Expanded(
              child: StreamBuilder(
                  stream: Fbase.propertyStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      controller.propertyList.clear();
                      snapshot.data!.docs.map((document) {
                        Map data = document.data() as Map<String, dynamic>;
                        controller.propertyList.add(data);
                      }).toList();
                    }
                    if (controller.propertyList.isEmpty) {
                      return Column(
                        children: [
                          Image.asset('assets/images/noproperty.png'),
                          Text(
                            'No result found',
                            style: TextStyle(
                                fontSize: Get.width * 0.05, fontFamily: alata),
                          )
                        ],
                      );
                    }

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.propertyList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                             Get.toNamed(Routes.propertyDetail,arguments: controller.propertyList[index]);
                          },
                          child: CardComponent(
                            innerPadding: EdgeInsets.zero,
                            outerPadding: EdgeInsets.zero,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.25,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: controller.propertyList[index]
                                              ['houseImages'][0],
                                          errorWidget: (context, url, error) =>
                                              CircleAvatar(
                                            backgroundColor:
                                                Colors.indigo.shade100,
                                            child: const Icon(Icons.house_sharp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.width * 0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: Get.width * 0.04),
                                        Text(
                                            controller.propertyList[index]
                                                ['title'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Get.width * 0.045)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.width * 0.025,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: Get.width * 0.04),
                                        Text(
                                            "Post on : ${controller.propertyList[index]['date']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.width * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: Get.width * 0.055),
                                        Column(
                                          children: [
                                            Text(
                                                "₹ ${controller.propertyList[index]['rent']}",
                                                style: TextStyle(
                                                    fontSize: Get.width * 0.06,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.deepOrange)),
                                            Text("per month",
                                                style: TextStyle(
                                                  fontSize: Get.width * 0.035,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.045,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          height: Get.width * 0.1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5)),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1.5)),
                                            child: CustomElevatedButton(
                                              bgColor: Colors.white,
                                              padding: 0,
                                              textStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: Get.width * 0.03),
                                              title: "Schedule visit",
                                              onPress: () {},
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.03,
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          child: CustomElevatedButton(
                                            padding: 0,
                                            textStyle: TextStyle(
                                                fontSize: Get.width * 0.03,
                                                color: Colors.white),
                                            title: "Contact owner",
                                            onPress: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: Get.width * 0.035),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text("Read more..."),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
