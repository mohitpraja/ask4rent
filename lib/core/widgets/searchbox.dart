// ignore_for_file: must_be_immutable

import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends GetView {
  final Color? borderColor;
  final double? borderRadius;
  @override
  final TextEditingController? controller;
  Function(String?)? onChanged;
  final String? Function(String?)? validator;

  SearchField(
      {super.key,
      this.onChanged,
      this.validator,
      this.borderColor,
      this.controller,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search by city name...',
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
            borderSide: BorderSide(color: borderColor ?? primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
            borderSide: BorderSide(color: borderColor ?? primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      validator: validator,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
