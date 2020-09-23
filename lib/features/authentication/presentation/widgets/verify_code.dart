import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/services/phone_authentiaction.dart';
import '../../../../core/widgets/loading_dialog_widget.dart';
import '../pages/phone_number_verify_code.dart';
import 'button.dart';

class FormVerifyCode extends StatefulWidget {
  final FormVerifyCodeArguments arguments;
  FormVerifyCode({Key key, this.arguments}) : super(key: key);

  @override
  _FormVerifyCodeState createState() => _FormVerifyCodeState();
}

class _FormVerifyCodeState extends State<FormVerifyCode> {
  var onTapRecognizer;
  StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
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
    return Form(
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
                    await _onSubmit();
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
                onSubmit: _verificationId == null
                    ? null
                    : () async {
                        if (textEditingController.text.length == 6) {
                          await _onSubmit();
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

  Future<void> _onSubmit() async {
    _openLoadingDialog(context);
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: textEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) async {
      _closeLoadingDialog();
      if (value.user != null) {
        Navigator.pop(context, true);
      } else {
        showSnackBar("Error validating OTP, try again");
      }
    }).catchError((error) {
      print(error.toString());
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
        phoneNumber: "+84${_formatPhoneNumber(widget.arguments.phoneNumber)}",
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

  _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith("0")) return phoneNumber.substring(1);
    return phoneNumber;
  }
}
