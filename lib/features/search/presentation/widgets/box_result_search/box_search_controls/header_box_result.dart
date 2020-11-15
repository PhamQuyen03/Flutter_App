import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

import 'avatar_box.dart';

class HeaderBoxResult extends StatelessWidget {
  final String urlThumbnail;
  final String title;
  final String subTitle;
  HeaderBoxResult(this.urlThumbnail, this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AvatarBox(),
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: new TextStyle(
                      fontSize: 16.0,
                      color: Palette.textBlack,
                      fontWeight: subTitle != null
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  if (subTitle != null) ...[
                    Text(
                      subTitle,
                      style: new TextStyle(
                        fontSize: 12.0,
                        color: Palette.subTextColor,
                      ),
                    ),
                  ] else
                    ...[]
                ],
              ),
            ),
          ],
        ));
  }
}
