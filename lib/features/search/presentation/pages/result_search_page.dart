import 'package:flutter/material.dart';
import '../model/result_search.dart';
import './widgets/box_result.dart';

class ResultSearchPage extends StatelessWidget {
  final List<ResultSearch> resultSearches;

  ResultSearchPage({Key key, @required this.resultSearches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Color(0xFFF3F3F3),
      body: ListView.builder(
          itemCount: resultSearches.length,
          itemBuilder: (context, index) {
            return BoxResult(resultSearch: resultSearches[index]);
          }),
    );
  }
}
