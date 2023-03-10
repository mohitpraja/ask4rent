import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, this.height, this.indent});
  final double? height;
  final double? indent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 5,
      color: color ?? primaryColor,
      endIndent: indent ?? 0.0,
    );
  }
}
