import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewBoxHeader extends StatelessWidget {
  final String fullName;
  final String avatar;
  final String timeAgo;
  final int userId;

  const NewBoxHeader(
      {Key key,
      @required this.fullName,
      @required this.avatar,
      @required this.timeAgo,
      @required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 45,
                color: Colors.orangeAccent,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fullName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Palette.textDarkBlue),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(fontSize: 12.0),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
          Icon(
            FontAwesomeIcons.ellipsisH,
            color: Colors.grey,
            size: 20,
          )
        ],
      ),
    );
  }
}
