import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends GetView {
  final String title;
  final VoidCallback onPress;
  final TextStyle? textStyle;
  final Color? color;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;

  const CustomElevatedButton(
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
              borderRadius: BorderRadius.circular(borderRadius ?? 10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: textStyle ?? TextStyle(color: Colors.white,fontFamily: alata,letterSpacing: 1,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}