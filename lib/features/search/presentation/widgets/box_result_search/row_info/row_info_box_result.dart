import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowInfoBoxResult extends StatelessWidget {
  final String uriImage;
  final String title;
  final String type;

  const RowInfoBoxResult({Key key, this.uriImage, this.title, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            type == null
                ? SvgPicture.asset(uriImage)
                : Image(image: AssetImage(uriImage)),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: Palette.textBlack, fontSize: 14),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
