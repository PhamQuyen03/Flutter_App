import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

class HeaderBoxResultExcesice extends StatelessWidget {
  final String title1;
  final String title2;
  HeaderBoxResultExcesice(this.title1, this.title2);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: new Container(
                    padding: new EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: new Text(
                      title1,
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
                  '4.5',
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
                  'từ 289 đánh giá',
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
                  '22.000 lượt làm bài',
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
