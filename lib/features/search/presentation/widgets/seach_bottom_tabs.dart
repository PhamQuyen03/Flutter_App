import 'package:flutter/material.dart';

class SearchBottomTabs extends StatelessWidget {
  const SearchBottomTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.amber[700],
      labelColor: Colors.amber[700],
      tabs: [
        Tab(
          child: Text(
            'Mọi người',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Nhóm',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Bài tập',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Game',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Tab 5',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Tab 6',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
