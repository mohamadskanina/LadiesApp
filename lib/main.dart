import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shopping/spalsh/splash_screen.dart';
import 'package:shopping/theme/colors.dart';

void main() {
  runApp(const MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        //main color

        //main font
        fontFamily: 'Roboto-Medium',
        //swatch stretching
        primaryColor: black,
        splashColor: accent,
        backgroundColor: black,
        highlightColor: accent,
      ),
      title: 'Ladies App',
      debugShowCheckedModeBanner: false,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: SpalshScreen(),
      ),
    );
  }
}



/*

MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //main color
        primaryColor: const Color(0xffFFC600),
        //main font
        fontFamily: 'Roboto-Medium',
        //swatch stretching
        primarySwatch: goldenThemeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        splashColor:  const Color(0xffFFC600),

        //color for scrollbar
        highlightColor: Color(0xffffc600)

      ),

      routes: {
        '/' : (context) => SplashScreen(),
        ...
      }
      initialRoute: '/',
    )

*/