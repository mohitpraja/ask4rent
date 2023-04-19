import 'dart:developer';
import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:ask4rent/core/widgets/custom_elevatedbutton.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/feature/propertyDetail/controller/property_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailView extends GetView<PropertyDetailController> {
  const PropertyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        toolbarHeight: 35,
        leadingWidth: 20,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          color: lightBlack,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: lightBlack,
          )
        ],
      ),
      body: ScrollGlowRemover(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.propertyDetails['title'],
                  style: AppStyle.titleStyle,
                ),
                commonSpace1(),
                GestureDetector(
                  onTap: () {
                    SwipeImageGallery(
                      context: context,
                      itemBuilder: (context, index) {
                        return Image.network(
                            controller.propertyDetails['houseImages'][index]);
                      },
                      itemCount:
                          controller.propertyDetails['houseImages'].length,
                    ).show();
                  },
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: controller.propertyDetails['houseImages'][0],
                        errorWidget: (context, url, error) => CircleAvatar(
                          backgroundColor: Colors.indigo.shade100,
                          child: const Icon(Icons.house_sharp),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.propertyDetails['houseImages'].length,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () {
                                SwipeImageGallery(
                                  context: context,
                                  itemBuilder: (context, index) {
                                    return Image.network(controller
                                        .propertyDetails['houseImages'][index]);
                                  },
                                  initialIndex: index,
                                  itemCount: controller
                                      .propertyDetails['houseImages'].length,
                                ).show();
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: controller
                                        .propertyDetails['houseImages'][index],
                                    errorWidget: (context, url, error) =>
                                        CircleAvatar(
                                      backgroundColor: Colors.indigo.shade100,
                                      child: const Icon(Icons.house_sharp),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Rent : ', style: AppStyle.ownerSeekerStyle1),
                    Text(
                      controller.propertyDetails['rent'],
                      style: TextStyle(
                          fontSize: Get.width * 0.06,
                          color: primaryColor,
                          fontFamily: ubuntu,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                commonSpace1(),
                Text(
                  controller.propertyDetails['propertyDescription'],
                  style: TextStyle(
                      fontSize: Get.width * 0.042,
                      fontFamily: ubuntu,
                      fontWeight: FontWeight.w400,
                      color: lightBlack),
                ),
                commonSpace1(),
                Text(
                  'Features -',
                  style: AppStyle.titleStyle,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Area',
                          style: AppStyle.titleStyle1,
                        ),
                        Text(
                          controller.propertyDetails['area'],
                          style: AppStyle.titleStyle1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Furnishing Status',
                          style: AppStyle.titleStyle1,
                        ),
                        Text(
                          controller.propertyDetails['furnishingStatus'],
                          style: AppStyle.titleStyle1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Property Type',
                          style: AppStyle.titleStyle1,
                        ),
                        Text(
                          controller.propertyDetails['propertyType'],
                          style: AppStyle.titleStyle1,
                        ),
                      ],
                    )
                  ],
                ),
                commonSpace1(),
                Text(
                  'Address -',
                  style: AppStyle.titleStyle,
                ),
                Text(
                  '${controller.propertyDetails['address']},${controller.propertyDetails['city']},${controller.propertyDetails['state']}',
                  style: TextStyle(
                      fontSize: Get.width * 0.042,
                      fontFamily: ubuntu,
                      fontWeight: FontWeight.w400,
                      color: lightBlack),
                ),
                InkWell(
                  onTap: () async {
                    log('you clicked on map');
                    String query = Uri.encodeComponent(
                        '${controller.propertyDetails['address']},${controller.propertyDetails['city']},${controller.propertyDetails['state']}');
                    String googleUrl =
                        "https://www.google.com/maps/search/?api=1&query=$query";
                    // ignore: deprecated_member_use
                    if (await canLaunch(googleUrl)) {
                      // ignore: deprecated_member_use
                      await launch(googleUrl);
                    }
                    // Uri googleUrl = Uri.parse(
                    //     "https://www.google.com/maps/search/?api=1&query=$query");
                    // launchUrl(googleUrl);
                  },
                  child: Text('Show on Map',
                      style: TextStyle(
                          fontSize: Get.width * 0.04,
                          decoration: TextDecoration.underline,
                          fontFamily: ubuntu,
                          fontWeight: FontWeight.w400,
                          color: primaryColor)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  child: CustomElevatedButton(
                    title: 'Book a house',
                    onPress: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
