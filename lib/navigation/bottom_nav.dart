import 'package:flutter/material.dart';

import 'navigation.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final RouteItem currentTab;
  final ValueChanged<RouteItem> onSelectTab;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      items: _buildBottomNavigationItems(),
      onTap: (index) => onSelectTab(NavigationSetting.appTabList[index]
          // RouteItem.values[index],
          ),
      currentIndex: NavigationSetting.appTabList.indexOf(currentTab),
    );
  }

  _buildBottomNavigationItems() {
    List<BottomNavigationBarItem> items = new List<BottomNavigationBarItem>();
    NavigationSetting.appTabs.forEach((key, value) {
      items.add(
          BottomNavigationBarItem(icon: Icon(value.icon), label: value.title));
    });
    return items;
  }
}
