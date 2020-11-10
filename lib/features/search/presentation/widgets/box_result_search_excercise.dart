import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/core/config/palette.dart';
import '../data/models/result_search.dart';
import 'row_info_box_result.dart';
import 'header_box_result.dart';
import '../data/models/tab_bar_search_model.dart';

class BoxResultSearchExcersice extends StatelessWidget {
  final ResultSearch resultSearch;
  final TabBarSearchModel tab;
  final formatterNumber = new NumberFormat("#,###");

  BoxResultSearchExcersice(
      {Key key, @required this.resultSearch, @required this.tab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
      child: Ink(
        height: 168,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5, offset: Offset(0, 4), color: Color(0xffdddddd)),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {
            debugPrint('ontab');
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                HeaderBoxResult('ulr image', 'Đề thi môn Toán tốt nghiệp  ',
                    '4.5 sao - từ 289 đánh giá'),
                RowInfoBoxResult(
                    Icon(
                      Icons.info,
                      color: Palette.iconInactive,
                    ),
                    'Là nhóm dành cho các bạn yêu thích môn wwwww'),
                RowInfoBoxResult(
                    Icon(
                      Icons.article,
                      color: Palette.iconInactive,
                    ),
                    '111 bài viết'),
                Row(
                  children: [
                    HeaderBoxResult('ulr image', 'Tác giả', null),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
