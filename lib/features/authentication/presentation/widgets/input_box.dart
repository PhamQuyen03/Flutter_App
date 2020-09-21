import 'package:flutter/material.dart';

typedef void OnChanged(String value);
typedef void OnSaved(String value);
typedef String Validator(String str);

class InputBoxControl extends StatefulWidget {
  final OnChanged onChanged;
  final OnSaved onSaved;
  final Validator validator;
  final String placeHolder;
  final bool obscureText;
  final TextInputType textInputType;
  final Key formFieldKey;
  final IconData prefixIcon;
  final String initialValue;
  InputBoxControl(
      {Key key,
      this.placeHolder,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.textInputType = TextInputType.text,
      this.formFieldKey,
      this.prefixIcon,
      this.initialValue,
      this.obscureText = false})
      : super(key: key);

  @override
  _InputBoxControlState createState() => _InputBoxControlState();
}

class _InputBoxControlState extends State<InputBoxControl> {
  final Color _color = Color(0xff7a82a9);

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      key: widget.formFieldKey,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      style: TextStyle(fontSize: 20.0, color: Colors.white70),
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: widget.validator,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.orange),
        hintText: widget.placeHolder,
        hintStyle: TextStyle(color: _color),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.orange)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: _color)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: _color)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.grey)),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _color,
        ),
        prefixStyle: TextStyle(color: _color),
      ),
    );
  }
}
