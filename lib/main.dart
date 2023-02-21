import 'package:ask4rent/core/allpages.dart';
import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ask4rent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:primarySwatch,
      ),
      initialRoute: Routes.splash,
      getPages: allpages,

    );
  }
}

