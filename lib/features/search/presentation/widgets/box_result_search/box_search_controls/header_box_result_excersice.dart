import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:intl/intl.dart';

class HeaderBoxResultExcesice extends StatelessWidget {
  final String title;
  final double stars;
  final int totalReview;
  final int totalDone;
  HeaderBoxResultExcesice(
      {@required this.title,
      @required this.stars,
      @required this.totalReview,
      @required this.totalDone});

  final formatterNumber = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 5),
        child: Column(
          children: [
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontSize: 16.0, color: Palette.textBlack),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      stars.toString(),
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
                  ],
                ),
                Text(
                  'từ $totalReview đánh giá',
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
                  '${formatterNumber.format(totalDone)} lượt làm bài',
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
