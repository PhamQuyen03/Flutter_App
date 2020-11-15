import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../navigation/navigation.dart';
import '../../../../core/api/api.dart';
import '../../../../core/services/authentication_service.dart';
import '../../../../injection_container.dart';

class SettingsPage extends StatelessWidget {
  final AuthenticationService _auth = sl<AuthenticationService>();
  final Dio dio = sl<Dio>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Open search'),
              onPressed: () async {
                await navigateFeature(context, RouteItem.search);
                //Navigator.of(context,rootNavigator: true).
                //await _logOut(context);
              },
            ),
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
      ),
    );
  }

  _logOut(context) async {
    if (await this._auth.isLoggedIn()) {
      //await this.dio.get(`${this.url}/api/authenticate/logout?refresh_token=${this.getRefreshToken()}`).subscribe();
      await this._auth.logOut();
    }
    navigateToLoginPage(context);
  }
}
