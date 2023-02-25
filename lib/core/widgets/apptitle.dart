import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('A',style: TextStyle(fontFamily: pacifico,color: primaryColor,fontSize: Get.width*0.1),),
        Text('skforRent',style: TextStyle(fontFamily: pacifico,fontSize: Get.width*0.1),),
        ],
    );
  }
}