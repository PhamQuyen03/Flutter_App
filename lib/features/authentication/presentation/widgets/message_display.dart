import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String messsage;
  final int type;
  const MessageDisplay({Key key, @required this.messsage, this.type = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            messsage,
            style: TextStyle(
                fontSize: 16.0, color: type == 1 ? Colors.blue : Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
