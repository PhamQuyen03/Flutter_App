import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

class HeaderBoxResult extends StatelessWidget {
  final String urlThumbnail;
  final String title1;
  final String title2;
  HeaderBoxResult(this.urlThumbnail, this.title1, this.title2);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: SizedBox(
                height: 36,
                width: 36,
                child: new Stack(children: <Widget>[
                  new Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image(
                        // image: NetworkImage(
                        //     'https://cf.shopee.vn/file/c5c914b0b2ccff570c46751e7c7ade41&zimken.jpg'),
                        image: AssetImage('assets/icons/coin.png'),
                        width: 36,
                        height: 36,
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  new Positioned(
                    right: -1,
                    bottom: -1,
                    child: new Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.white),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.lens_rounded,
                        color: Colors.red,
                        size: 10,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: new TextStyle(
                      fontSize: 16.0,
                      color: Palette.textBlack,
                      fontWeight:
                          title2 != null ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (title2 != null) ...[
                    Text(
                      title2,
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
