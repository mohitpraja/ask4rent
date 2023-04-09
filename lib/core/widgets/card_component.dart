import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent(
      { Key? key,
        this.child,
        this.borderColor,
        this.backgroundColor,
        this.innerPadding,
        this.outerPadding,
        this.gradient})
      : super(key: key);

  final Widget? child;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsets? outerPadding;
  final EdgeInsets? innerPadding;
  final bool? gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
          padding: innerPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: backgroundColor ?? white,
            border: Border.all(color: primaryColor.withOpacity(0.05)),
            borderRadius: BorderRadius.circular(12),
            boxShadow:  const [
              BoxShadow(
                color: Color(0x3fd0d0d0),
                blurRadius: 8,
                offset: Offset(0, 9),
              ),
            ],
            gradient: gradient == true ? gradientColor : null,
          ),
          child: child),
    );
  }
}
