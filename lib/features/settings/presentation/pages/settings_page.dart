import 'package:flutter/material.dart';
import 'package:flutter_app/authentication/authentication_service.dart';
import 'package:flutter_app/features/authentication/presentation/pages/login_part.dart';

import '../../../../injection_container.dart';

class SettingsPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Log out'),
        onPressed: () async {
          await _logOut(context);
        },
      ),
    );
  }

  _logOut(context) async {
    if (await this._auth.isLoggedIn()) {
      //this._http.get(`${this.url}/api/authenticate/logout?refresh_token=${this.getRefreshToken()}`).subscribe();
      await this._auth.clearTokens();
      await this._auth.updateUser(null);
    }
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
