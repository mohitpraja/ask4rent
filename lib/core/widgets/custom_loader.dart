import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:ask4rent/core/global/colors.dart';
import 'package:get/get.dart';

class CustomLoader {
  CustomLoader({this.title, this.isDismissable});

  final String? title;
  final bool? isDismissable;

  loader() {
    Get.dialog(
        barrierDismissible: isDismissable ?? false,
        Center(
          child: Container(
            width: Get.width * 0.7,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CircularProgressIndicator(
                  color: primaryShade1,
                  backgroundColor: primaryColor,
                ),
                const SizedBox(width: 15),
                Text(title ?? 'Please wait ...',
                    style: TextStyle(
                        color: lightBlack,
                        fontFamily: ubuntu,
                        decoration: TextDecoration.none,
                        fontSize: Get.width * 0.05))
              ],
            ),
          ),
        ));
  }

  loader1() {
    Get.dialog(
        barrierDismissible: isDismissable ?? false,
        const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            backgroundColor: primaryColor,
          ),
        ));
  }
}
