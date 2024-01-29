import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/feature/savedProperty/controller/saved_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedPropertyView extends GetView<SavedPropertyController> {
  const SavedPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Saved Properties',
        titleSpacing: 15,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/bookmark.png',height: Get.height*0.4,fit: BoxFit.fitHeight,)),
            Text('There is no saved properties',style: TextStyle(fontSize: 18,fontFamily: alata,color: lightBlack),)
          ],
        ),
      ),
    );
  }
}
