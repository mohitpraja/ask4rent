import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:ask4rent/core/widgets/custom_outlinebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternet extends GetView {
  const NoInternet({super.key, this.onTryAgain});
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        margin: const EdgeInsets.all(20),
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: Icon(
                    Icons.wifi_off,
                    size: Get.width * 0.2,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "You're offline",
                  style: TextStyle(
                    fontSize: Get.width * 0.06,
                    fontFamily: alata,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Check your connection & get back when you're online",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.width * 0.045,
                    color: Colors.black54,
                    fontFamily: josefin,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 0.4,
                  child: CustomOutlineButton(
                    borderRadius: 10,
                    title: 'Try again',
                    onPress: () {
                      checkInternet(() {
                        isInternet.value = false;
                        onTryAgain!();
                      });
                    },
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon.png',
                    width: 30,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'AskforRent',
                    style: TextStyle(
                        fontSize: Get.width * 0.05,
                        fontFamily: pacifico,
                        color: lightBlack),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
