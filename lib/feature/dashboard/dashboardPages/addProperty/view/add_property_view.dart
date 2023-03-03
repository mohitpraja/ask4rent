import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/widgets/apptitle.dart';
import 'package:ask4rent/core/widgets/custom_appbar.dart';
import 'package:ask4rent/feature/dashboard/dashboardPages/addProperty/controller/add_property_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyView extends GetView<AddPropertyController> {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const AppTitle(),
          SizedBox(height: commonSpace,),
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text('#One stop solution to Rent and Manage your property',textAlign: TextAlign.center,style: TextStyle(fontSize: Get.width*0.06,fontFamily: ubuntu,color: white,fontWeight: FontWeight.bold),),
                  SizedBox(height: commonSpace,),
                  Text('We help you market, manage & maintain your home. Keep earning rent, until you decide to sell.',textAlign: TextAlign.center,style: TextStyle(color: white,fontFamily: lato),)
            
                ],
              ),
            ),
          )
        ],),
      )
    );
  }
}
