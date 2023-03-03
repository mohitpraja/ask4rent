import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWhiteAppBar extends GetView with PreferredSizeWidget {
  // final String title;
  // final VoidCallback? onPress;
  // final Color? color;
  // final Color? colors;
  // final TextStyle? style;

  const CustomWhiteAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: lightBlack,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
