import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPress;
  final TextStyle? textStyle;
  final Color? borderColor;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;
  final double? padding;
  final double? fonstSize;
  final Widget? child;
  const CustomOutlineButton(
      {super.key,
      this.padding,
      this.title,
      required this.onPress,
      this.textStyle,
      this.borderColor,
      this.fonstSize,
      this.shape,
      this.elevation,
      this.borderRadius,
      this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          side: BorderSide(color: borderColor ?? primaryColor)),
      color: Colors.white,
      elevation: elevation ?? 0,
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 10),
        child: child ??
            Text(
              title ?? '',
              style: textStyle ??
                  TextStyle(
                    color: primaryColor,
                    letterSpacing: 1,
                    fontSize: fonstSize??13,
                    fontFamily: alata,
                    fontWeight: FontWeight.bold,
                  ),
            ),
      ),
    );
  }
}
