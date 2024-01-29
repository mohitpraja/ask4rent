import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWhiteAppBar extends GetView implements PreferredSizeWidget {
  // final String title;
  // final VoidCallback? onPress;
  // final Color? color;
  // final Color? colors;
  // final TextStyle? style;
  final double? height;

  const CustomWhiteAppBar({
    this.height,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      toolbarHeight: height??50,
      elevation: 0,
      leadingWidth: 20,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight( height??50);
}
