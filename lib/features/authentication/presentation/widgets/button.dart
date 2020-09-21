import 'package:flutter/material.dart';

typedef void OnSubmit();

class ButtonWidget extends StatelessWidget {
  final OnSubmit onSubmit;
  final String label;
  final Color color;
  final TextStyle textStyle;
  final bool isDisable;
  const ButtonWidget(
      {Key key,
      this.label,
      this.color,
      this.textStyle,
      this.onSubmit,
      this.isDisable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onSubmit,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            label,
            style: textStyle,
          ),
        ),
        color: color,
      ),
    );
  }
}
