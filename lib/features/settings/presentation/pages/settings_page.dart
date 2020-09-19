import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/api/api.dart';
import 'package:flutter_app/core/services/authentication_service.dart';
import 'package:flutter_app/features/authentication/presentation/pages/login_part.dart';

import '../../../../injection_container.dart';

class SettingsPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();
  final Dio dio = sl<Dio>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            child: Text('Log out'),
            onPressed: () async {
              await _logOut(context);
            },
          ),
          RaisedButton(
            child: Text('Send'),
            onPressed: () async {
              var res = await dio.get(Api.SUBJECT);
              print(res.toString());
            },
          ),
        ],
      ),
    );
  }

  _logOut(context) async {
    if (await this._auth.isLoggedIn()) {
      //await this.dio.get(`${this.url}/api/authenticate/logout?refresh_token=${this.getRefreshToken()}`).subscribe();
      await this._auth.logOut();
    }
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
