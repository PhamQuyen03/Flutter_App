import 'package:flutter/material.dart';

enum TabItem { home, test, search, trivia, settings }

Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.test: 'Test',
  TabItem.search: 'Search',
  //TabItem.speech: 'Speech',
  TabItem.trivia: 'Trivia',
  TabItem.settings: 'Settings'
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.test),
        _buildItem(tabItem: TabItem.search),
        _buildItem(tabItem: TabItem.trivia),
        _buildItem(tabItem: TabItem.settings),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon;
    switch (tabItem) {
      case TabItem.home:
        {
          icon = Icons.home;
          break;
        }
      case TabItem.test:
        {
          icon = Icons.list;
          break;
        }
      case TabItem.search:
        {
          icon = Icons.search;
          break;
        }
      case TabItem.trivia:
        {
          icon = Icons.layers;
          break;
        }
      case TabItem.settings:
        {
          icon = Icons.settings;
          break;
        }
    }
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
