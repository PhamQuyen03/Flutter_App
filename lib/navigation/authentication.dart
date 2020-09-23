import 'package:flutter/material.dart';

import 'route_generator.dart';

class AuthenticationRootNavigator extends StatelessWidget {
  const AuthenticationRootNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: AuthenticationRouteGenerator.generateRoute,
    );
  }
}
