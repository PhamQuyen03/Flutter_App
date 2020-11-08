import 'package:flutter/material.dart';

class RowInfoBoxResult extends StatelessWidget {
  final Icon icon;
  final String title;
  RowInfoBoxResult(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
              ),
            ],
          ),
        )
      ],
    );
  }
}
