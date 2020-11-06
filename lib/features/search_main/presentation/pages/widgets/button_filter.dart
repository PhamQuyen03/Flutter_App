import 'package:flutter/material.dart';

typedef void OnClick();

class ButtonFilter extends StatelessWidget {
  final OnClick onClick;
  const ButtonFilter({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 20,
      padding: new EdgeInsets.all(0.0),
      child: FlatButton(
        child: Icon(
          Icons.filter_alt_outlined,
          color: Colors.amber[700],
        ),
        onPressed: () => this.onClick,
      ),
    );
  }
}
