import 'package:flutter/material.dart';

import '../widgets/verify_code.dart';

class FormVerifyCodeArguments {
  final String phoneNumber;
  final String password;
  final String fullName;
  final String email;
  FormVerifyCodeArguments(
    this.phoneNumber,
    this.password,
    this.fullName,
    this.email,
  );
}

class PhoneNumberVerifyPage extends StatelessWidget {
  final FormVerifyCodeArguments arguments;
  PhoneNumberVerifyPage(this.arguments) {
    print(arguments.phoneNumber);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone Number'),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //top half screen
            Container(
              child: Column(children: [
                Text(
                  'Enter the OTP code',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the code we sent to: +0123456789",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FormVerifyCode(
                  arguments: arguments,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
