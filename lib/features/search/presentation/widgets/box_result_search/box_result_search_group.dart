import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/result_search.dart';
import 'row_info/row_info_box_result.dart';
import 'header/header_box_result.dart';
import '../../data/models/tab_bar_search_model.dart';
import 'layout_box_result_search.dart';

class BoxResultSearchGroup extends StatelessWidget {
  final ResultSearch resultSearch;
  final TabBarSearchModel tab;
  final formatterNumber = new NumberFormat("#,###");

  BoxResultSearchGroup(
      {Key key, @required this.resultSearch, @required this.tab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBoxResultSearch(
        onPress: () => {print('onpress group')},
        childElement: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        top: 12, right: 12, left: 12, bottom: 8),
                    child: Column(children: <Widget>[
                      HeaderBoxResult('ulr image', 'Group Học tập',
                          'Nhóm - 999 nghìn thành viên'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(children: [
                              Row(
                                children: [
                                  RowInfoBoxResult(
                                      uriImage: 'assets/icons/Graph.svg',
                                      title:
                                          'Là nhóm dành cho các bạn yêu thích môn'),
                                ],
                              ),
                              Row(
                                children: [
                                  RowInfoBoxResult(
                                      uriImage: 'assets/icons/Graph.svg',
                                      title:
                                          '${formatterNumber.format(2000)} bài viết'),
                                ],
                              ),
                            ]),
                          )
                        ],
                      ),
                    ])),
              ],
            ),
            new Positioned(
                right: 10.0,
                bottom: 8.0,
                child: OutlineButton(
                    borderSide: BorderSide(color: Colors.amber[700]),
                    onPressed: () {
                      print('Received click');
                    },
                    child: Text(
                      'Tham gia',
                      style: new TextStyle(fontSize: 12),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)))),
          ],
        ));
  }
}
