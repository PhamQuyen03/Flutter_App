import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

class RowInfoBoxResult extends StatelessWidget {
  final Icon icon;
  final String title;
  RowInfoBoxResult(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Flexible(
          child: new Container(
            padding: new EdgeInsets.only(right: 10.0, left: 5),
            child: new Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: new TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                color: Palette.textBlack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
