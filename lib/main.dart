import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './injection_container.dart' as di;
import './styles.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yodo Study English',
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: primaryColor,
        accentColor: secondColor,
        primaryColorLight: subTextColor,
        // Define the default font family.
        fontFamily: 'OpenSans',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: titleFontSize,
                color: primaryColor,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: normalFontSize),
            subtitle1: TextStyle(fontSize: smallFontSize, color: subTextColor),
            bodyText2: TextStyle(fontSize: normalFontSize),
            subtitle2:
                TextStyle(fontSize: normalFontSize, color: subTextColor)),
      ),
      home: SplashScreen(),
    );
  }
}
