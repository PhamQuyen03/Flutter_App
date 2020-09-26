import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../navigation/app.dart';
import '../../../../core/services/authentication_service.dart';
import '../../../../core/widgets/loading_dialog_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/login/login_bloc.dart';
import '../widgets/form_login.dart';
import '../widgets/message_display.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Palette.primaryColor,
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: BlocProvider(
            create: (context) => sl<LoginBloc>(),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (BuildContext context, LoginState state) async {
                if (state is Loading) {
                  _openLoadingDialog(context);
                }
                if (state is Loaded) {
                  await this._auth.updateUser(state.loginResponse.user);
                  await this._auth.storeTokens(new Tokens(
                      accessToken: state.loginResponse.accessToken,
                      refreshToken: state.loginResponse.refreshToken,
                      sessionId: state.loginResponse.sessionId));
                  _closeLoadingDialog();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AppRootNavigator()),
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
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FormLogin(),
                      SizedBox(
                        height: 15,
                      ),
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
                        return SizedBox(
                          child: Text('Successfully'),
                          height: 50,
                        );
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
            ),
          ),
        ),
      ),
    );
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
