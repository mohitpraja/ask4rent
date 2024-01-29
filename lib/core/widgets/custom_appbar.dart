import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPress;
  final Color? appBarColor;
  final Color? colors;
  final bool? showBackButton;
  final double? elevation;
  final double? titleSpacing;
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
    this.titleSpacing,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: white,fontFamily: alata),),
      backgroundColor: appBarColor ?? primaryColor,
      titleSpacing:titleSpacing?? 0,
      automaticallyImplyLeading: showBackButton ?? false,
      elevation: elevation ?? 5,
      leading:showBackButton!=true? null:leading ??
          IconButton(
            onPressed: onBackPress ?? () => Get.back(),
            icon: backIcon ??
                const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
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