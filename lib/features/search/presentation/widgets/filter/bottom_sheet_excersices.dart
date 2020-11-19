import 'package:flutter/material.dart';

class BottomSheetExcersices extends StatelessWidget {
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
              'Excersices',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Divider(thickness: 1),
        Text('Excersices 1 '),
        Text('Excersices 2 '),
        Text('Excersices 3 '),
        Text('Excersices 4 '),
      ],
    );
  }
}
