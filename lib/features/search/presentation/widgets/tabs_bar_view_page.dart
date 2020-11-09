import 'package:flutter/material.dart';
import '../data/models/result_search.dart';
import 'content_tab_bar_view_page.dart';

class TabBarViewPage extends StatefulWidget {
  final List<ResultSearch> resultSearches;
  TabBarViewPage(this.resultSearches);

  @override
  _TabBarViewPageState createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ContentTabBarViewPage(widget.resultSearches),
        ContentTabBarViewPage(widget.resultSearches),
        ContentTabBarViewPage(widget.resultSearches),
        ContentTabBarViewPage(widget.resultSearches),
        ContentTabBarViewPage(widget.resultSearches),
        ContentTabBarViewPage(widget.resultSearches),
      ],
    );
  }
}
