import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 160,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            // FBase.userInfo['name'],
                            // 'Hi! ${FBase.userInfo['name'].split(' ').first}',
                            'Name',
                            style: AppStyle.drawerHeading),
                        Text('1234567890', style: AppStyle.drawerHeading1),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: CachedNetworkImage(
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        imageUrl: '',
                        errorWidget: (context, url, error) => CircleAvatar(
                            backgroundColor: primaryShade1,
                            child: const Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard,color: drawerIconColor,),
            horizontalTitleGap: 0,
            title: Text('Dashboard', style: AppStyle.drawerStyle),
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1,color:drawerIconColor),
            horizontalTitleGap: 0,
            title: Text('Edit Profile', style: AppStyle.drawerStyle),
          ),
          ListTile(
            leading: const Icon(Icons.task,color:drawerIconColor),
            horizontalTitleGap: 0,
            title: Text('Listed Properties', style: AppStyle.drawerStyle),
          ),
          ListTile(
            leading: const Icon(Icons.settings,color:drawerIconColor),
            horizontalTitleGap: 0,
            title: Text('Setting', style: AppStyle.drawerStyle),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app,color:drawerIconColor),
            minLeadingWidth: 5,
            title: Text('Logout', style: AppStyle.drawerStyle),
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
