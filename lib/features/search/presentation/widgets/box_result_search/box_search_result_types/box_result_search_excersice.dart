import 'package:flutter/material.dart';

import '../../../../../../core/config/app_icons.dart';
import '../../../data/models/result_search.dart';
import '../../../data/models/tab_bar_search_model.dart';
import '../box_search_controls/widgets.dart';
import '../layout_box_result_search.dart';

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
                title: 'Đề thi môn Toán tốt nghiệp 908908 980980sdf',
                stars: 45,
                totalReview: 300,
                totalDone: 22000),
            RowInfoBoxResult(
              items: [
                new RowInfoBoxItemModel(
                  icon: AppIcon.graph,
                  title: '90 cau',
                ),
                new RowInfoBoxItemModel(
                  icon: AppIcon.duration,
                  title: 'Toan 12',
                ),
              ],
            ),
            RowInfoBoxResult(
              items: [
                new RowInfoBoxItemModel(
                  icon: AppIcon.graph,
                  title: '180 phut',
                ),
                new RowInfoBoxItemModel(
                  icon: AppIcon.coin,
                  title: '500 xu',
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
                  child: Row(
                    children: [
                      AvatarBox(),
                      Text(
                        'Dang minh duoc',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Ngày đăng'),
                      Text('20/10/2020'),
                    ],
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
