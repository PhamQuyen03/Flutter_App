import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/authentication_service.dart';
import '../../../../injection_container.dart';
import '../bloc/login/login_bloc.dart';
import '../widgets/form_register.dart';

class RegisterPage extends StatelessWidget {
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
          title: Text('Sign Up'),
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 25.0),
            padding: const EdgeInsets.all(15.0),
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
            if (state is Loading) {
              // _openLoadingDialog(context);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //top half screen
              Container(
                child: Column(children: [
                  FormRegister(),
                ]),
              ),
            ],
          ),
        ));
  }
}
