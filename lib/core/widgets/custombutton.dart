import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView {
  final String title;
  final VoidCallback onPress;
  final TextStyle? textStyle;
  final Color? color;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;

  const CustomButton(
      {required this.title,
      required this.onPress,
      this.textStyle,
      this.color,
      this.shape,
      this.elevation,
      this.borderRadius,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: color ?? primaryColor,
      elevation: elevation ?? 0,
      shape: shape ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
      child: Text(
        title,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
              fontFamily: ubuntu
            ),
      ),
    );
  }
}
