import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.inputType,
      this.textStyle,
      this.maxLength,
      required this.hintText,
      this.preficIcon,
      this.borderRadius,
      this.controller,
      this.validator,
      this.onchanged,
      this.readonly,
      this.borderColor,
      this.initialValue});

  final TextInputType? inputType;
  final TextStyle? textStyle;
  final int? maxLength;
  final bool? readonly;
  final String hintText;
  final String? initialValue;
  final Icon? preficIcon;
  final Color? borderColor;
  final double? borderRadius;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      style: textStyle ?? const TextStyle(color: Colors.black54),
      maxLength: maxLength,
      readOnly: false,
      decoration: InputDecoration(
          contentPadding: preficIcon == null
              ? const EdgeInsets.symmetric(vertical: 0, horizontal: 10)
              : EdgeInsets.zero,
          hintStyle: textStyle ?? const TextStyle(color: Colors.black54),
          hintText: hintText,
          counterText: '',
          prefixIcon: preficIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: BorderSide(color: borderColor ?? primaryColor))),
      validator: validator,
      controller: controller,
      onChanged: onchanged,
      textInputAction: TextInputAction.next,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
