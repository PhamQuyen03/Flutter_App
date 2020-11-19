import 'package:flutter/material.dart';
import '../../data/models/result_search.dart';
import '../../data/models/tab_bar_search_model.dart';
import '../box_result_search/box_search_result_types/widgets.dart';

class ContentTabBarViewPage extends StatefulWidget {
  final TabBarSearchModel tab;
  ContentTabBarViewPage({Key key, @required this.tab}) : super(key: key);

  @override
  _ContentTabBarViewPageState createState() => _ContentTabBarViewPageState();
}

class _ContentTabBarViewPageState extends State<ContentTabBarViewPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController controller;
  List<ResultSearch> resultSearches = [];
  int count = 0;
  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
    setState(() {
      resultSearches = List.generate(
        20,
        (i) => ResultSearch(
          'Ket qua tim kiem ${widget.tab.type} ${i + 1}',
          'Noi dung ket qua tim kiem ${widget.tab.type} ${i + 1}',
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 100) {
      setState(() {
        count = count + 1;
        resultSearches.addAll(new List.generate(
            20,
            (index) => ResultSearch(
                  'Ket qua tim kiem ${widget.tab.type} ${resultSearches.length + index + 1}',
                  'Noi dung ket qua tim kiem ${widget.tab.type} ${resultSearches.length + index + 1}',
                )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: ListView.builder(
          controller: controller,
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

  @override
  bool get wantKeepAlive => true;
}
