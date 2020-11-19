import 'package:flutter/material.dart';

class BottomSheetGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Center(
            child: Text(
              'Group',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Divider(thickness: 1),
        Text('Group 1 '),
        Text('Group 2 '),
      ],
    );
  }
}
