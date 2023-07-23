import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color primary = Color(0xff000000);
const Color medium = Color(0xff515151);
const Color secondary = Color(0xffffffff);
const Color accent = Color(0xFFFB9CB5);

// void openWhats({String phone, String msg}) async {
//   String url = "whatsapp://send?phone=$phone&text=$msg";
//   await launchUrl(url) ? launch(url) : print('error');
// }

void openurl(String url) async {
  var _url = Uri.parse(url);
  if (!await launchUrl(_url)) throw 'Could not launch $url';
}

// const Color success = Color(0xff44c93a);
// const Color danger = Color(0xffff4657);
// const Color info = Color(0xff5bc0de);
// const Color warning = Color(0xfffeba06);

// const Color bgAppbarBlack = Color(0xff232528);
// const Color bgAppbarWhite = Color(0xffffffff);

// const Color bgAppbarGradientStart = Color(0xFF191C20);
// const Color bgAppbarGradientEnd = Color(0xFF29313E);

// const Color bgButtonBlack = Color(0xFF17181A);
// const Color bgButtonBlue = Color(0xFF3B66BE);
// const Color bgButtonWhite = Color(0xffffffff);

const Color black = Color(0xff000000);
const Color white = Color(0xffffffff);
// const Color blue = Color(0xff0D47A1);
const Color grey = Color(0xffbdbdbd);
// const Color lineWhite = Color(0xffececec);
// const Color lineGrey = Color(0xffbdbdbd);
// const Color lineTextGrey = Color(0xff9E9E9E);

// const Color darkModeButton = Color(0xff2F3641);
// const Color lightModeButton = Color(0xff000000);
// const Color darkBgCircle = Color(0xff2F3641);

// const Color primary = Color(0xff000000);
// const Color medium = Color(0xff515151);
// const Color secondary = Color(0xffffffff);
// const Color accent = Color(0xFFEA9F5A);

// const Color success = Color(0xff44c93a);
// const Color danger = Color(0xffff4657);
// const Color info = Color(0xff5bc0de);
// const Color warning = Color(0xfffeba06);

// const Color bgAppbarBlack = Color(0xff232528);
// const Color bgAppbarWhite = Color(0xffffffff);

// const Color bgAppbarGradientStart = Color(0xFF191C20);
// const Color bgAppbarGradientEnd = Color(0xFF29313E);

// const Color bgButtonBlack = Color(0xFF17181A);
// const Color bgButtonBlue = Color(0xFF3B66BE);
// const Color bgButtonWhite = Color(0xffffffff);

// const Color black = Color(0xffffffff);
// const Color white = Color(0xff000000);
// const Color blue = Color(0xff0D47A1);
// const Color grey = Color(0xffbdbdbd);
// const Color lineWhite = Color(0xffececec);
// const Color lineGrey = Color(0xffbdbdbd);
// const Color lineTextGrey = Color(0xff9E9E9E);

// const Color darkModeButton = Color(0xff2F3641);
// const Color lightModeButton = Color(0xff000000);
// const Color darkBgCircle = Color(0xff2F3641);


 