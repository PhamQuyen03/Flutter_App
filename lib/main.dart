import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './injection_container.dart' as di;
import 'core/config/palette.dart';
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
        primaryColor: Palette.primaryColor,
        accentColor: Palette.secondColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Palette.textBlack,
          ),
        ),
        // Define the default font family.
        fontFamily: 'OpenSans',
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
      home: SplashScreen(),
    );
  }
}
