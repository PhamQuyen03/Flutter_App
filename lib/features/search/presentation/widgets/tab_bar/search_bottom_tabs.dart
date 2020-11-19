import 'package:flutter/material.dart';
import '../../data/models/tab_bar_search_model.dart';

class SearchBottomTabs extends StatelessWidget {
  final List<TabBarSearchModel> tabs;
  final TabController tabController;
  SearchBottomTabs({@required this.tabs, this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        controller: tabController,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.amber[700],
        labelColor: Colors.amber[700],
        tabs: List.generate(
            tabs.length,
            (index) => Tab(
                  child: Text(
                    tabs[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )));
  }
}
