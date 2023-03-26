import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.045,
        ),
        Image.asset(
          'assets/images/nodata.png',
        ),
        Text(
          title ?? 'No data found',
          style: TextStyle(color: lightBlack, fontFamily: alata),
        ),
      ],
    );
  }
}
