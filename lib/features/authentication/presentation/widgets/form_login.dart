import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_bloc.dart';
import 'button.dart';
import 'input_box.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  String _phoneNumber;
  String _password;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  @override
  @override
  void initState() {
    super.initState();
  }

  bool isSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidate: isSubmitted,
      child: Column(
        children: [
          InputBoxControl(
            placeHolder: "Phone Number",
            onSaved: (value) => _phoneNumber = value,
            onChanged: (value) => dispatchResetLoginForm(),
            validator: validatePhoneNumber,
            textInputType: TextInputType.phone,
            prefixIcon: Icons.phone,
          ),
          SizedBox(
            height: 15,
          ),
          InputBoxControl(
            placeHolder: "Password",
            onSaved: (value) => _password = value,
            onChanged: (value) => dispatchResetLoginForm(),
            validator: (value) {
              if (value.length == 0) return "Enter your password";
              return null;
            },
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          SizedBox(
            height: 15,
          ),
          ButtonWidget(
            label: 'LOGIN',
            onSubmit: () {
              _onSubmit(context);
            },
            color: Theme.of(context).accentColor,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          ClickableText(),
        ],
      ),
    );
  }

  String validatePhoneNumber(String value) {
    String pattern = r'(^0\d*$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return "Enter your phone number";
    } else if (value.length > 11) {
      return "Invalid phone number";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }

  void _onSubmit(BuildContext context) {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      this.isSubmitted = true;
      dispatchSendLoginRequest();
    }
  }

  void dispatchSendLoginRequest() {
    //controller.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(SendLoginRequestEvent(_phoneNumber, _password));
  }

  void dispatchResetLoginForm() {
    if (isSubmitted) {
      BlocProvider.of<LoginBloc>(context).add(ResetLoginFormEvent());
      isSubmitted = false;
    }
  }
}

class ClickableText extends StatelessWidget {
  const ClickableText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.grey),
        children: <TextSpan>[
          TextSpan(text: "Don't have an account? "),
          TextSpan(
              text: 'Sign up for free',
              style: TextStyle(color: Theme.of(context).accentColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed('/register');
                }),
        ],
      ),
    );
  }
}
