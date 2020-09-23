import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/authentication_service.dart';
import '../../../../core/widgets/loading_dialog_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/register/register_bloc.dart';
import '../widgets/form_register.dart';

class RegisterPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    RegisterBloc bloc = sl<RegisterBloc>();
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

  BlocProvider<RegisterBloc> buildBody(
      BuildContext context, RegisterBloc bloc) {
    return BlocProvider(
        create: (context) => bloc,
        child: BlocListener(
          cubit: bloc,
          listener: (BuildContext context, RegisterState state) async {
            if (state is RegisterInitial) {
              _closeLoadingDialog();
            }
            if (state is RegisterLoading) {
              _openLoadingDialog(context);
            }
            if (state is RegisterError) {
              _closeLoadingDialog();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.message,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ));
            }
            if (state is RegisterLoaded) {
              _closeLoadingDialog();
              Navigator.pushReplacementNamed(context, '/register/succeed');
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
