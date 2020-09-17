import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String messsage;
  const MessageDisplay({Key key, @required this.messsage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            messsage,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
