import 'package:flutter/material.dart';

//? HEX CODE OF cOLOR IS #FF581A
const Color primaryColor = Color(0xffFF581A);
Color primaryShade1 = Colors.deepOrange.shade200;
Color primaryShade2 = Colors.deepOrange.shade300;
Color white = Colors.white;
const Color drawerIconColor= Colors.black54;

const Color lightBlack = Colors.black54;
const MaterialColor primarySwatch = MaterialColor(
  0xffff581a, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xffce5641), //10%
    100: Color(0xffb74c3a), //20%
    200: Color(0xffa04332), //30%
    300: Color(0xff89392b), //40%
    400: Color(0xff733024), //50%
    500: Color(0xff5c261d), //60%
    600: Color(0xff451c16), //70%
    700: Color(0xff2e130e), //80%
    800: Color(0xff170907), //90%
    900: Color(0xff000000), //100%
  },
);
