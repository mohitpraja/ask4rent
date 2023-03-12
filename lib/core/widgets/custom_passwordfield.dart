import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField(
      {super.key,
      this.controller,
      this.onchanged,
      this.validator,
      this.initialValue,
      this.borderColor,
      this.borderRadius,
      this.hintext});
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final String? Function(String?)? validator;
  final String? hintext;
  final String? initialValue;
  final Color? borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          style: const TextStyle(color: Colors.black54),
          obscureText: isPass.value,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintStyle: const TextStyle(color: Colors.black54),
              hintText: hintext ?? 'Enter Password',
              suffixIcon: IconButton(
                  onPressed: () => showPass(),
                  icon: isPass.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
              prefixIcon: const Icon(Icons.lock),
           enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              borderSide: BorderSide(color: borderColor ?? Colors.black54)),
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
          validator: validator,
          onChanged: onchanged,
          initialValue: initialValue,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ));
  }
}
