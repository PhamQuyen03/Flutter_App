import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app.dart';
import '../../../../core/services/authentication_service.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc/login_bloc.dart';
import '../widgets/form_login.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();

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
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: buildBody(context, bloc),
          ),
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
            if (state is Loaded) {
              await this._auth.updateUser(state.loginResponse.user);
              await this._auth.storeTokens(new Tokens(
                  accessToken: state.loginResponse.accessToken,
                  refreshToken: state.loginResponse.refreshToken,
                  sessionId: state.loginResponse.sessionId));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => App()),
              );
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //top half screen
              FormLogin(),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      messsage: "Login to yofunny",
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return MessageDisplay(
                      messsage: "Successfully",
                    );
                  } else if (state is Error) {
                    return MessageDisplay(
                      messsage: state.message,
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
