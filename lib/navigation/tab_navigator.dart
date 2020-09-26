import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/route_generator.dart';

import 'bottom_nav.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  Route<dynamic> getRoutes(settings) {
    switch (tabItem) {
      case TabItem.home:
        return HomeRouteGenerator.generateRoute(settings);
      case TabItem.speech:
        return SpeechRouteGenerator.generateRoute(settings);
      case TabItem.trivia:
        return TriviaRouteGenerator.generateRoute(settings);
      case TabItem.settings:
        return SettingsRouteGenerator.generateRoute(settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey, initialRoute: '/', onGenerateRoute: getRoutes);
  }
}
