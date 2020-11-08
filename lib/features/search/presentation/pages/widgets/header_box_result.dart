import 'package:flutter/material.dart';

class HeaderBoxResult extends StatelessWidget {
  final String urlThumbnail;
  final String title1;
  final String title2;
  HeaderBoxResult(this.urlThumbnail, this.title1, this.title2);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.person,
          color: Colors.pink[200],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
              ),
              Text(
                title2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
