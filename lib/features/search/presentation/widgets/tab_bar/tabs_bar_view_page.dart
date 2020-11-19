import 'package:flutter/material.dart';
import 'content_tab_bar_view_page.dart';
import '../../data/models/tab_bar_search_model.dart';

class TabBarViewPage extends StatelessWidget {
  final List<TabBarSearchModel> tabs;
  final TabController tabController;
  TabBarViewPage({@required this.tabs, this.tabController});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: tabController,
        children: List.generate(
            tabs.length,
            (index) => Tab(
                  child: ContentTabBarViewPage(tab: tabs[index]),
                )));
  }
}
