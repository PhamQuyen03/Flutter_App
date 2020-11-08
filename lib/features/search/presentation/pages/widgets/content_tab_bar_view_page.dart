import 'package:flutter/material.dart';
import '../../model/result_search.dart';
import 'box_result_search.dart';

class ContentTabBarViewPage extends StatelessWidget {
  final List<ResultSearch> resultSearches;
  ContentTabBarViewPage(this.resultSearches);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: ListView.builder(
          itemCount: resultSearches.length,
          itemBuilder: (context, index) {
            return BoxResultSearch(resultSearch: resultSearches[index]);
          }),
    );
  }
}
