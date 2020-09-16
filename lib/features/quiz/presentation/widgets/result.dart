import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function restartHandler;
  Result(this.restartHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Brilliant bro!"),
          RaisedButton(
            onPressed: restartHandler,
            child: Text("Restart!"),
          )
        ],
      )),
    );
  }
}
