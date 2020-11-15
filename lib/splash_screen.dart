import 'dart:async';
import 'package:flutter/material.dart';
import 'core/config/palette.dart';
import 'core/services/authentication_service.dart';
import 'injection_container.dart';
import 'navigation/app.dart';
import 'navigation/navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthenticationService _auth = sl<AuthenticationService>();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: 35.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            Column(
              children: [
                Text(
                  'Giải trí - Kết nối - Học tập',
                  style: TextStyle(
                      fontSize: 16,
                      color: Palette.secondColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    // _storage.read(key: '')
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    if (await _auth.isLoggedIn()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppRootNavigator()),
      );
    } else {
      navigateToLoginPage(context);
    }
  }
}
