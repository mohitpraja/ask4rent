import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView with PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPress;
  final Color? appBarColor;
  final Color? colors;
  final bool? showBackButton;
  final double? elevation;
  final TextStyle? style;
  final Widget? leading;
  final Icon? backIcon;

  const CustomAppBar({
    this.elevation,
    this.leading,
    this.backIcon,
    required this.title,
    this.showBackButton,
    this.onBackPress,
    this.appBarColor,
    this.colors,
    this.style,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: white,fontFamily: alata),),
      backgroundColor: appBarColor ?? primaryColor,
      automaticallyImplyLeading: showBackButton ?? false,
      elevation: elevation ?? 5,
      leading:showBackButton!=true? null:leading ??
          IconButton(
            onPressed: onBackPress ?? () => Get.back(),
            icon: backIcon ??
                const Icon(
                  Icons.arrow_back,
                  color: lightBlack,
                ),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}


// AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('List Your Property',style: TextStyle(color: white,fontFamily: alata),),
//       )