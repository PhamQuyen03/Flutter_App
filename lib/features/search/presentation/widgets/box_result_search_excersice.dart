import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/core/config/palette.dart';
import '../data/models/result_search.dart';
import 'header_box_result_excersice.dart';
import 'header_box_result.dart';
import '../data/models/tab_bar_search_model.dart';

class Info extends StatelessWidget {
  final String uriImage;
  final String title;
  final String type;

  const Info(
      {Key key, @required this.uriImage, @required this.title, this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          type == null
              ? SvgPicture.asset(uriImage)
              : Image(image: AssetImage(uriImage)),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: TextStyle(color: Palette.textBlack, fontSize: 14),
            ),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width / 2 - 30,
    );
  }
}

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
        height: 185,
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
                HeaderBoxResultExcesice(
                    'Đề thi môn Toán tốt nghiệp 908908 980980sdf ',
                    '4.5 sao - từ 289 đánh giá'),
                Row(
                  children: [
                    Info(uriImage: 'assets/icons/Graph.svg', title: '90 câu'),
                    Info(uriImage: 'assets/icons/Work.svg', title: 'Toán 12'),
                  ],
                ),
                Row(
                  children: [
                    Info(
                        uriImage: 'assets/icons/TimeCircle.svg',
                        title: '180 phút'),
                    Info(
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
                    Container(
                      child: HeaderBoxResult('ulr image',
                          'Rebecca Ferguson dang minh duoc dep trai lam', null),
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Text('Ngày đăng'), Text('20/10/2020')],
                      ),
                      width: MediaQuery.of(context).size.width / 2 - 60,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
