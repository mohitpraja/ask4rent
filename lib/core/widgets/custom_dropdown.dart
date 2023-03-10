import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDropDown extends GetView {
  CustomDropDown(
      {super.key,
      this.boxCornerRadius,
      required this.onChanged,
      required this.items,
      this.hintText,
      this.icon,
      this.borderColor,
      this.value,
      this.borderRadius,
      this.hinTextStyle,
      this.validator});

  final double? boxCornerRadius;
  Function(String?)? onChanged;
  final double? borderRadius;
  final TextStyle? hinTextStyle;
  final String? Function(String?)? validator;
  List<DropdownMenuItem<String>>? items;
  String? hintText;
  Color? borderColor;
  dynamic value;
  dynamic icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      elevation: 8,
      borderRadius: BorderRadius.circular(
        boxCornerRadius ?? 5,
      ),
      isExpanded: true,
      icon: icon ?? const Icon(Icons.arrow_drop_down),
      hint: Text(
        hintText ?? '',
        style: hinTextStyle ??
            TextStyle(
              fontSize: Get.width * 0.04,
            ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(color: borderColor ?? primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(color: borderColor ?? primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      value: value,
      validator: validator,
      items: items,
      onChanged: onChanged,
      dropdownColor: white,
    );
  }
}
