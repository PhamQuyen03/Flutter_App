import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app.dart';
import '../../../../core/services/authentication_service.dart';
import '../../../../core/widgets/loading_dialog_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/login/login_bloc.dart';
import '../widgets/message_display.dart';
import '../widgets/verify_code.dart';

class PhoneNumberVerifyPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = sl<LoginBloc>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verify Phone Number'),
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: buildBody(context, bloc),
        ),
      ),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context, LoginBloc bloc) {
    return BlocProvider(
        create: (context) => bloc,
        child: BlocListener(
          cubit: bloc,
          listener: (BuildContext context, LoginState state) async {
            if (state is Loading) {
              _openLoadingDialog(context);
            }
            if (state is Loaded) {
              // await this._auth.updateUser(state.loginResponse.user);
              // await this._auth.storeTokens(new Tokens(
              //     accessToken: state.loginResponse.accessToken,
              //     refreshToken: state.loginResponse.refreshToken,
              //     sessionId: state.loginResponse.sessionId));
              _closeLoadingDialog();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => App()),
              );
            }
            if (state is Error) {
              _closeLoadingDialog();
            }
          },
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
                  FormVerifyCode(),
                ]),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return SizedBox(
                      height: 50,
                    );
                  } else if (state is Loading) {
                    return SizedBox(
                      height: 50,
                    );
                  } else if (state is Loaded) {
                    return SizedBox();
                  } else if (state is Error) {
                    return MessageDisplay(
                      messsage: state.message,
                      type: 2,
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }

  _openLoadingDialog(BuildContext context) {
    if (isLoading) return;
    isLoading = true;
    LoadingDialogWidget.showLoadingDialog(context, _keyLoader);
  }

  _closeLoadingDialog() {
    if (!isLoading) return;
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    isLoading = false;
  }
}
