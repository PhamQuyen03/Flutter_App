import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app.dart';
import '../bloc/bloc/login_bloc.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  TextEditingController controller = TextEditingController();
  String phoneNumber;
  String password;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final phoneNumberField = TextField(
      obscureText: false,
      style: style,
      onChanged: (value) {
        phoneNumber = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "PhoneNumber",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Column(
      children: [
        phoneNumberField,
        SizedBox(
          height: 10,
        ),
        passwordField,
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: dispatchSendLoginRequest,
                child: Text('Login'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                child: Text('Register'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void dispatchSendLoginRequest() {
    //controller.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(SendLoginRequestEvent(phoneNumber, password));
  }
}
