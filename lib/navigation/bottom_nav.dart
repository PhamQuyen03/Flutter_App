import 'package:flutter/material.dart';

enum TabItem { home, trivia }

Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.trivia: 'Trivia',
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.trivia),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.layers;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      title: Text(
        text,
      ),
    );
  }
}