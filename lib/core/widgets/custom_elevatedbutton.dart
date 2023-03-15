import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends GetView {
  final String title;
  final String? disableText;
  final VoidCallback? onPress;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? bgColor;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;
  final double? padding;
  final double? fonstSize;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.textStyle,
      this.textColor,
      this.bgColor,
      this.shape,
      this.elevation,
      this.borderRadius,
      this.padding,
      this.fonstSize,
      this.disableText});

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialButton(
          // ignore: avoid_returning_null_for_void
          onPressed: isButtonDisable.value ? () => null : onPress,
          color: isButtonDisable.value ? Colors.grey : bgColor ?? primaryColor,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5))),
          child: Padding(
            padding: EdgeInsets.all(padding ?? 10),
            child: Text(
              isButtonDisable.value ? disableText??'Processing...' : title,
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? Colors.white,
                    letterSpacing: 1,
                    fontFamily: alata,
                    fontSize: fonstSize ?? 13,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ));
  }
}

// import 'package:ask4rent/core/global/colors.dart';
// import 'package:ask4rent/core/global/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomElevatedButton extends GetView {
//   final String title;
//   final VoidCallback onPress;
//   final TextStyle? textStyle;
//   final Color? color;
//   final ShapeBorder? shape;
//   final double? elevation;
//   final double? borderRadius;
//   final double? padding;

//   const CustomElevatedButton(
//       {required this.title,
//       required this.onPress,
//       this.textStyle,
//       this.color,
//       this.shape,
//       this.elevation,
//       this.borderRadius,
//       this.padding,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onPress,
//       color: color ?? primaryColor,
//       elevation: elevation ?? 0,
//       shape: shape ??
//           RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius ?? 10)),
//       child: Padding(
//         padding: EdgeInsets.all(padding ?? 10),
//         child: Text(
//           title,
//           style: textStyle ??
//               TextStyle(
//                   color: Colors.white,
//                   fontFamily: alata,
//                   letterSpacing: 1,
//                   fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
