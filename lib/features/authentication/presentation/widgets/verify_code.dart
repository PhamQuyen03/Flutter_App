import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/phone_authentiaction.dart';
import 'package:flutter_app/core/widgets/loading_dialog_widget.dart';
import 'package:flutter_app/features/authentication/domain/usercases/request_register.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../injection_container.dart';
import 'button.dart';

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

class FormVerifyCode extends StatefulWidget {
  final String phoneNumber = "338004227";
  FormVerifyCode({Key key}) : super(key: key);

  @override
  _FormVerifyCodeState createState() => _FormVerifyCodeState();
}

class _FormVerifyCodeState extends State<FormVerifyCode> {
  RequestRegister requestRegister = sl<RequestRegister>();
  var onTapRecognizer;
  StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final formKey = GlobalKey<FormState>();
  PhoneAuthenticationService phoneAuth;

  bool isCodeSent = false;
  bool isLoading = false;
  String _verificationId;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    _onVerifyCode();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FormVerifyCodeArguments registerModel =
        ModalRoute.of(context).settings.arguments;
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Column(
            children: [
              PinCodeTextField(
                backgroundColor: Colors.transparent,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v.length < 3) {
                    return "I'm from validator";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  //inactiveColor: Colors.white,

                  inactiveFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: hasError ? Colors.orange : Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                //   backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  //await _onSubmit();
                },
                onSubmitted: (pin) async {
                  if (pin.length == 6) {
                    await _onSubmit(registerModel);
                  } else {
                    showSnackBar("Invalid OTP");
                  }
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              SizedBox(
                height: 25.0,
              ),
              ButtonWidget(
                label: 'VERIFY NOW',
                onSubmit: () async {
                  if (textEditingController.text.length == 6) {
                    await _onSubmit(registerModel);
                  } else {
                    showSnackBar("Invalid OTP");
                  }
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
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(text: "Didn't recieve the code? "),
                    TextSpan(
                        text: 'Resend',
                        style: TextStyle(color: Theme.of(context).accentColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _onVerifyCode(true);
                          }),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Future<void> _onSubmit(FormVerifyCodeArguments registerModel) async {
    _openLoadingDialog(context);
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: textEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) async {
      _closeLoadingDialog();
      if (value.user != null) {
        // Handle loogged in state
        var response = await requestRegister.call(Params(
          phoneNumber: registerModel.phoneNumber,
          password: registerModel.password,
          fullName: registerModel.fullName,
          email: registerModel.email,
        ));
        response.fold((l) async {
          showSnackBar("Failed to create your account");
          await Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
        }, (r) {
          if (r >= 1)
            Navigator.of(context).pushReplacementNamed('/register/succeed');
          else
            showSnackBar("Falied to create your account");
        });
      } else {
        showSnackBar("Error validating OTP, try again");
      }
    }).catchError((error) {
      _closeLoadingDialog();
      showSnackBar("Something went wrong");
    });
  }

  void _onVerifyCode([bool isResend = false]) async {
    setState(() {
      isCodeSent = true;
    });

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user != null) {
          // Handle loogged in state
          print(value.user.phoneNumber);
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HomePage(
          //         user: value.user,
          //       ),
          //     ),
          //     (Route<dynamic> route) => false);
        } else {
          showSnackBar("Error validating OTP, try again");
        }
      }).catchError((error) {
        showSnackBar("Try again in sometime");
      });
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showSnackBar(authException.message);
      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      forceResendingToken = forceResendingToken;
      if (isResend) {
        showSnackBar('Another code has sent to your device');
      }
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;

      setState(() {
        _verificationId = verificationId;
      });
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+84${widget.phoneNumber}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        forceResendingToken: forceResendingToken,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  int forceResendingToken;
  void showSnackBar(String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  _openLoadingDialog(BuildContext context) {
    if (!isLoading) {
      LoadingDialogWidget.showLoadingDialog(context, _keyLoader);
      isLoading = true;
    }
  }

  _closeLoadingDialog() {
    if (isLoading) {
      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      isLoading = false;
    }
  }
}
