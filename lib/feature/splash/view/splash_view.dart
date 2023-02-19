import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: CustomColor.primaryColor,
      child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
               TyperAnimatedText(
                'AskforRent',
                textStyle: AppStyle.splashStyle,
                speed: const Duration(milliseconds: 150),
              ),
            ],
            totalRepeatCount: 100,
          )),
    ));
  }
}
