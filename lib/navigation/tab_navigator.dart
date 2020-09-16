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
      case TabItem.trivia:
        return TriviaRouteGenerator.generateRoute(settings);
    }
  }

  // void _push(BuildContext context, {int materialIndex: 500}) {
  //   var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               routeBuilders[TabNavigatorRoutes.detail](context)));
  // }

  // Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
  //     {int materialIndex: 500}) {
  //   return {
  //     TabNavigatorRoutes.root: (context) => ColorsListPage(
  //           color: TabHelper.color(tabItem),
  //           title: TabHelper.description(tabItem),
  //           onPush: (materialIndex) =>
  //               _push(context, materialIndex: materialIndex),
  //         ),
  //     TabNavigatorRoutes.detail: (context) => ColorDetailPage(
  //           color: TabHelper.color(tabItem),
  //           title: TabHelper.description(tabItem),
  //           materialIndex: materialIndex,
  //         ),
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    //var routeBuilders = _routeBuilders(context);

    // return Navigator(
    //     key: navigatorKey,
    //     initialRoute: TabNavigatorRoutes.root,
    //     onGenerateRoute: (routeSettings) {
    //       return MaterialPageRoute(
    //           builder: (context) => routeBuilders[routeSettings.name](context));
    //     });
    //   return Navigator(
    //       key: navigatorKey,
    //       initialRoute: '/',
    //       onGenerateRoute: RouteGenerator.generateRoute);
    // }
    return Navigator(
        key: navigatorKey, initialRoute: '/', onGenerateRoute: getRoutes);
  }
}
