import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/authentication_service.dart';
import 'package:flutter_app/navigation/bottom_nav.dart';
import '../injection_container.dart';
import 'tab_navigator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRootNavigator extends StatefulWidget {
  AppRootNavigator({Key key}) : super(key: key);

  @override
  _AppRootNavigatorState createState() => _AppRootNavigatorState();
}

class _AppRootNavigatorState extends State<AppRootNavigator> {
  AuthenticationService auth = sl<AuthenticationService>();
  TabItem _currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.trivia: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>()
  };
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

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(TabItem.home);
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
          return Stack(children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.test),
            _buildOffstageNavigator(TabItem.search),
            _buildOffstageNavigator(TabItem.trivia),
            _buildOffstageNavigator(TabItem.settings)
          ]);
        }),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
