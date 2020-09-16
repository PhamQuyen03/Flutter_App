import 'package:flutter/material.dart';
import '../../../../styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewBoxHeader extends StatelessWidget {
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
                      'Nguyễn Minh Tuấn',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '15 phút trước',
                      style: Theme.of(context).textTheme.subtitle1,
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
