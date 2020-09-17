import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/authentication/authentication_service.dart';
import 'package:flutter_app/features/authentication/presentation/pages/login_part.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'injection_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthenticationService _auth = sl<AuthenticationService>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
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
        MaterialPageRoute(builder: (context) => App()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
}
