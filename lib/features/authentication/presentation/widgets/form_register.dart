import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/usercases/request_register.dart';
import '../bloc/register/register_bloc.dart';
import '../pages/phone_number_verify_code.dart';
import 'button.dart';
import 'input_box.dart';

class FormRegister extends StatefulWidget {
  FormRegister({Key key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  RequestRegister requestRegister = sl<RequestRegister>();
  String _phoneNumber;
  String _password;
  String _fullName;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  GlobalKey<FormFieldState> passKey = new GlobalKey<FormFieldState>();
  bool isSubmitted = false;
  List<bool> isSelected = [false, true, false];
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: isSubmitted,
      key: formKey,
      child: Column(
        children: [
          Column(
            children: [
              Text(
                'WHO YOU ARE?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7a82a9),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              ToggleButtons(
                borderWidth: 0,
                borderColor: Colors.transparent,
                children: <Widget>[
                  ButtonToggleWidget(
                    assetImage: "assets/images/mom.png",
                    text: "PARENT",
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    backgroundColor: Colors.yellow,
                  ),
                  ButtonToggleWidget(
                    assetImage: "assets/images/kid.png",
                    text: "STUDENT",
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    backgroundColor: Colors.orange,
                  ),
                  ButtonToggleWidget(
                    assetImage: "assets/images/teacher.png",
                    text: "TEACHER",
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    backgroundColor: Colors.cyan,
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          InputBoxControl(
            placeHolder: "Full Name",
            onSaved: (value) => _fullName = value,
            onChanged: (value) => _dispatchResetForm(),
            validator: validateName,
            textInputType: TextInputType.text,
            prefixIcon: Icons.person,
          ),
          SizedBox(
            height: 15.0,
          ),
          InputBoxControl(
            placeHolder: "Phone Number",
            onSaved: (value) => _phoneNumber = value,
            onChanged: (value) => _dispatchResetForm(),
            validator: validatePhoneNumber,
            textInputType: TextInputType.phone,
            prefixIcon: Icons.phone,
          ),
          SizedBox(
            height: 15.0,
          ),
          InputBoxControl(
            placeHolder: "Password",
            formFieldKey: passKey,
            onSaved: (value) => _password = value,
            onChanged: (value) => _dispatchResetForm(),
            validator: validatePassword,
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          SizedBox(
            height: 15.0,
          ),
          InputBoxControl(
            placeHolder: "Confirm Password",
            onChanged: (value) => _dispatchResetForm(),
            validator: validatePasswordMatching,
            obscureText: true,
            prefixIcon: Icons.lock,
          ),
          SizedBox(
            height: 35.0,
          ),
          ButtonWidget(
            label: 'SIGN UP',
            onSubmit: () async {
              await _onSubmit(context);
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

  String validateName(String value) {
    String patttern =
        r'(^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ \n]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return "Enter your full name";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Full Name";
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Enter your password";
    } else if (value.length < 6) {
      return "Password should be more than 6.";
    }
    return null;
  }

  String validatePasswordMatching(String value) {
    // print(passKey.currentState.value);

    var password = passKey.currentState.value;

    if (value.length == 0) {
      return "Enter your confirm password";
    } else if (value != password) {
      return 'Password is not matching';
    }
    return null;
  }

  Future<void> _onSubmit(BuildContext context) async {
    setState(() {
      this.isSubmitted = true;
    });
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      final phoneValidated = await Navigator.of(context).pushNamed(
        '/register/verifycode',
        arguments: FormVerifyCodeArguments(
          _phoneNumber,
          _password,
          _fullName,
          "dangduoc@outlook.com",
        ),
      );
      if ((phoneValidated != null) && (phoneValidated == true)) {
        _dispatchRequestRegister();
      }
    }
  }

  void _dispatchRequestRegister() {
    if (isSubmitted) {
      BlocProvider.of<RegisterBloc>(context).add(SendRegisterRequestEvent(
          phoneNumber: _phoneNumber,
          password: _password,
          fullName: _fullName,
          email: "dangduoc@outlook.com"));
      isSubmitted = false;
    }
  }

  void _dispatchResetForm() {
    if (isSubmitted) {
      BlocProvider.of<RegisterBloc>(context).add(RegisterResetFormEvent());
      isSubmitted = false;
    }
  }
}

class ButtonToggleWidget extends StatelessWidget {
  final String text;
  final String assetImage;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  const ButtonToggleWidget({
    Key key,
    this.assetImage,
    this.text,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 30) / 3;

    return Container(
      padding: padding,
      width: width,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: backgroundColor,
              // borderRadius: BorderRadius.all(Radius.circular(width)),
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              assetImage,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            text,
            style:
                TextStyle(color: backgroundColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
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
          TextSpan(text: "Already have account? "),
          TextSpan(
              text: 'Login here',
              style: TextStyle(color: Theme.of(context).accentColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pop();
                }),
        ],
      ),
    );
  }
}
