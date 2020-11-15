import 'package:flutter/material.dart';
import '../../data/models/result_search.dart';
import '../../data/models/tab_bar_search_model.dart';
import '../box_result_search/box_result_search_group.dart';
import '../box_result_search/box_result_search_excersice.dart';
import '../box_result_search/box_result_search_member.dart';

class ContentTabBarViewPage extends StatefulWidget {
  final TabBarSearchModel tab;
  ContentTabBarViewPage({Key key, @required this.tab}) : super(key: key);

  @override
  _ContentTabBarViewPageState createState() => _ContentTabBarViewPageState();
}

class _ContentTabBarViewPageState extends State<ContentTabBarViewPage> {
  var resultSearches = List.generate(
    20,
    (i) => ResultSearch(
      'Ket qua tim kiem',
      'Noi dung ket qua tim kiem ${i + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: ListView.builder(
          itemCount: resultSearches.length,
          itemBuilder: (context, index) {
            switch (widget.tab.type) {
              case 'people':
                return BoxResultSearchMemeber(
                  resultSearch: resultSearches[index],
                  tab: widget.tab,
                );
              case 'excersice':
                return BoxResultSearchExcersice(
                    resultSearch: resultSearches[index], tab: widget.tab);
              default:
                return BoxResultSearchGroup(
                  resultSearch: resultSearches[index],
                  tab: widget.tab,
                );
            }
          }),
    );
  }
}
