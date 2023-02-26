import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneField extends GetView {
  const CustomPhoneField(
      {required this.hintText,
      this.initialCountryCode,
      this.borderColor,
      this.borderRadius,
      this.controller,
      this.validator,
      this.onChanged,
      this.onCountryChanged,
      super.key});

  final String hintText;
  final String? initialCountryCode;
  final Color? borderColor;
  final double? borderRadius;
  // ignore: annotate_overrides
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(PhoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(color: borderColor ?? primaryColor)),
      ),
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonMargin: const EdgeInsets.symmetric(horizontal: 8),
      initialCountryCode: initialCountryCode ?? 'IN',
      onChanged: onChanged,
      showCountryFlag: false,
      style: const TextStyle(color: lightBlack),
      onCountryChanged: onCountryChanged,
      controller: controller,
    );
  }
}
