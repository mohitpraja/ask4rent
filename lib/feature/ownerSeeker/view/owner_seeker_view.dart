import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/widgets/scrollglowremover.dart';
import 'package:ask4rent/feature/ownerSeeker/controller/owner_seeker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerSeekerView extends GetView<OwnerSeekerController> {
  const OwnerSeekerView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: white, size: 25)),
          title:  Text('Dashboard',style: TextStyle(fontFamily: alata),),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Material(
              color: Colors.grey.shade200,
              child: SizedBox(
                height: 55,
                child: TabBar(
                  physics: const BouncingScrollPhysics(),
                  indicatorColor: primaryColor,
                  tabs: controller.tabs,
                ),
              ),
            ),
          ),
        ),
        body: ScrollGlowRemover(child: TabBarView(children: controller.tabPages)),
      ),
    );
  }
}
