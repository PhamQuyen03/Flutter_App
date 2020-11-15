import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/core/config/palette.dart';
import '../../data/models/result_search.dart';
import 'header/header_box_result_excersice.dart';
import 'header/header_box_result.dart';
import '../../data/models/tab_bar_search_model.dart';
import 'layout_box_result_search.dart';
import 'row_info/row_info_box_result.dart';

class BoxResultSearchExcersice extends StatelessWidget {
  final ResultSearch resultSearch;
  final TabBarSearchModel tab;

  BoxResultSearchExcersice(
      {Key key, @required this.resultSearch, @required this.tab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBoxResultSearch(
      onPress: () => {print('onpress box excersice')},
      childElement: Padding(
        padding: const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 8),
        child: Column(
          children: [
            HeaderBoxResultExcesice(
                'Đề thi môn Toán tốt nghiệp 908908 980980sdf ',
                '4.5 sao - từ 289 đánh giá',
                4.5,
                300,
                22000),
            Row(
              children: [
                RowInfoBoxResult(
                    uriImage: 'assets/icons/Graph.svg', title: '90 câu'),
                RowInfoBoxResult(
                    uriImage: 'assets/icons/Work.svg', title: 'Toán 12'),
              ],
            ),
            Row(
              children: [
                RowInfoBoxResult(
                    uriImage: 'assets/icons/TimeCircle.svg', title: '180 phút'),
                RowInfoBoxResult(
                  uriImage: 'assets/icons/coin.png',
                  title: '500 xu',
                  type: 'png',
                ),
              ],
            ),
            Divider(
              color: Color(0xffEEEEEE),
              thickness: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: HeaderBoxResult('ulr image', 'Rebecca Ferguson', null),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Text('Ngày đăng'), Text('20/10/2020')],
                  ),
                  width: 100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
