import 'package:flutter/material.dart';
import 'content_tab_bar_view_page.dart';
import '../data/models/tab_bar_search_model.dart';

class TabBarViewPage extends StatefulWidget {
  final List<TabBarSearchModel> tabs;
  TabBarViewPage({Key key, @required this.tabs}) : super(key: key);

  @override
  _TabBarViewPageState createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: List.generate(
            widget.tabs.length,
            (index) => Tab(
                  child: ContentTabBarViewPage(tab: widget.tabs[index]),
                )));
  }
}
