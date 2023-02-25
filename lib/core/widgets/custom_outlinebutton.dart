import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPress;
  final TextStyle? textStyle;
  final Color? borderColor;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;
  final Widget? child;
  const CustomOutlineButton({super.key, this.title, required this.onPress, this.textStyle, this.borderColor, this.shape, this.elevation, this.borderRadius, this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?? 10),
          side: BorderSide(color:borderColor?? primaryColor)),
      color: Colors.white,
      elevation:elevation?? 0,
      onPressed: onPress,
      child:child?? Text(
        title??'',
        style:textStyle?? const TextStyle(color: primaryColor),
      ),
    );
  }
}
