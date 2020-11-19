import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController _textController;
  SearchBox(this._textController);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: SizedBox(
        child: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextField(
            onSubmitted: (String str) {
              debugPrint('on submit $str');
            },
            controller: widget._textController,
            // autofocus: true,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF3F3F3),
              hintText: 'Tìm kiếm',
              hintStyle: TextStyle(fontSize: 20.0, color: Color(0xffBDBDBD)),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xffBDBDBD),
                size: 36.0,
              ),
              suffixIcon: SizedBox(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    widget._textController.text = '';
                  },
                  child: Icon(
                    Icons.close,
                    color: Color(0xffBDBDBD),
                    size: 20.0,
                  ),
                ),
                width: 30.0,
              ),
              contentPadding:
                  const EdgeInsets.only(left: 14, top: 8, bottom: 8),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width - 60,
        height: 36,
      ),
    ));
  }
}
