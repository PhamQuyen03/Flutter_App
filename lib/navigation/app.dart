import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/authentication_service.dart';
import 'package:flutter_app/navigation/bottom_nav.dart';
import '../injection_container.dart';
import 'navigation.dart';
import './bottom_nav.dart';

//final navigatorKey = GlobalKey<NavigatorState>();

class AppRootNavigator extends StatefulWidget {
  AppRootNavigator({Key key}) : super(key: key);

  @override
  _AppRootNavigatorState createState() => _AppRootNavigatorState();
}

class _AppRootNavigatorState extends State<AppRootNavigator> {
  AuthenticationService auth = sl<AuthenticationService>();
  RouteItem _currentTab = NavigationSetting.initialPage;
  //Map<RouteItem, GlobalKey<NavigatorState>> _navigatorKeys = NavigationSetting.appNavigatorKeys;

  ScaffoldState scaffold;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await showSnackBar());
  }

  Future<void> showSnackBar() async {
    // if (await auth.isLoggedIn()) {
    //   var user = await auth.getUser();
    //   scaffold.showSnackBar(
    //       SnackBar(content: Text("You're logged in as " + user.fullName)));
    // }
  }

  void _selectTab(RouteItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      NavigationSetting.appNavigatorKeys[tabItem].currentState
          .popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await NavigationSetting
            .appNavigatorKeys[_currentTab].currentState
            .maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != NavigationSetting.initialPage) {
            // select 'main' tab
            _selectTab(NavigationSetting.initialPage);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Builder(builder: (context) {
          scaffold = Scaffold.of(context);
          return Stack(
            children: _buildOffstageNavigators(),
          );
        }),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  List<Widget> _buildOffstageNavigators() {
    List<Widget> list = new List<Widget>();
    NavigationSetting.appTabs.forEach((key, value) {
      list.add(
        Offstage(
          offstage: _currentTab != value.id,
          child: buildNavigatorForFeature(value.id),
        ),
      );
    });
    return list;
  }
}
