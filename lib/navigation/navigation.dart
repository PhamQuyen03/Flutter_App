import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/route_generator.dart';

enum RouteItem { home, test, search, trivia, settings, speech }

class IRouteItem {
  IRouteItem({this.id, this.title, this.icon});
  final RouteItem id;
  final String title;
  final IconData icon;
}

class NavigationSetting {
  static final RouteItem initialPage = RouteItem.speech;

  static final Map<RouteItem, GlobalKey<NavigatorState>> appNavigatorKeys =
      _initAppNavigatorKeys();

  static _initAppNavigatorKeys() {
    Map<RouteItem, GlobalKey<NavigatorState>> tmp = new Map();
    RouteItem.values.forEach((element) {
      tmp[element] = new GlobalKey<NavigatorState>();
    });
    return tmp;
  }

  static final Map<RouteItem, IRouteItem> appTabs = {
    RouteItem.home:
        new IRouteItem(id: RouteItem.home, title: 'Home', icon: Icons.home),
    RouteItem.test:
        new IRouteItem(id: RouteItem.test, title: 'Test', icon: Icons.list),
    RouteItem.speech: new IRouteItem(
        id: RouteItem.speech, title: 'Speech', icon: Icons.speaker),
    //RouteItem.speech: 'Speech',
    RouteItem.trivia: new IRouteItem(
        id: RouteItem.trivia, title: 'Trivia', icon: Icons.layers),
    RouteItem.settings: new IRouteItem(
        id: RouteItem.settings, title: 'Setting', icon: Icons.settings)
  };
  static final List<RouteItem> appTabList =
      appTabs.entries.map((e) => e.key).toList();
}

buildNavigatorForFeature(RouteItem feature) {
  return Navigator(
    key: NavigationSetting.appNavigatorKeys[feature],
    initialRoute: '/',
    onGenerateRoute: (settings) => getTabRoute(feature, settings),
  );
}

navigateFeature(BuildContext context, RouteItem feature) async {
  await Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (context) => Navigator(
        key: NavigationSetting.appNavigatorKeys[feature],
        initialRoute: '/',
        onGenerateRoute: (settings) => getTabRoute(feature, settings),
      ),
    ),
  );
}

Future navigatePopup(BuildContext context, Widget page) async {
  await Navigator.of(context, rootNavigator: true).push(// ensures fullscreen
      MaterialPageRoute(builder: (BuildContext _context) {
    return page;
  }));
}

navigateToLoginPage(BuildContext context) async {
  await Navigator.of(context, rootNavigator: true).pushReplacement(
    MaterialPageRoute(
      builder: (context) => Navigator(
        initialRoute: '/',
        onGenerateRoute: authenticationRoute,
      ),
    ),
  );
}
