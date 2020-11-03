import 'package:flutter/material.dart';
import '../../model/result_search.dart';

class BoxResult extends StatelessWidget {
  final ResultSearch resultSearch;

  BoxResult({Key key, @required this.resultSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(resultSearch.title);
  }
}
