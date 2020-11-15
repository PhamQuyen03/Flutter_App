import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:intl/intl.dart';

class HeaderBoxResultExcesice extends StatelessWidget {
  final String title1;
  final String title2;
  final double rateAvg;
  final int sumRate;
  final int view;
  HeaderBoxResultExcesice(
      this.title1, this.title2, this.rateAvg, this.sumRate, this.view);

  final formatterNumber = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: new Container(
                    padding: new EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: new Text(
                      title1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Palette.textBlack,
                        fontWeight: title2 != null
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  rateAvg.toString(),
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Palette.primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Icon(
                    Icons.star,
                    color: Palette.primaryColor,
                    size: 15,
                  ),
                ),
                Text(
                  'từ $sumRate đánh giá',
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Palette.subTextColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Icon(
                    Icons.lens_rounded,
                    color: Palette.subTextColor,
                    size: 7,
                  ),
                ),
                Text(
                  '${formatterNumber.format(view)} lượt làm bài',
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Palette.subTextColor,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
