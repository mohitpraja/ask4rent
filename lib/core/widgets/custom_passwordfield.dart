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
      this.hintext});
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final String? Function(String?)? validator;
  final String? hintext;
  final String? initialValue;

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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: validator,
          onChanged: onchanged,
          initialValue: initialValue,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ));
  }
}
