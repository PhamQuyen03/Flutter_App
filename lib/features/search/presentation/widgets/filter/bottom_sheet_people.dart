import 'package:flutter/material.dart';

class BottomSheetPeople extends StatelessWidget {
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
              'People',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Divider(thickness: 1),
        Text('People 1 '),
        Text('People 2 '),
        Text('People 3 '),
      ],
    );
  }
}
