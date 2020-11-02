import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  var textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
    ));

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Expanded(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: TextField(
                      onSubmitted: (String str) {
                        debugPrint('on submit $str');
                      },
                      // onChanged: (str) {
                      //   setState(() {
                      //   });
                      // },
                      controller: textController,
                      autofocus: true,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tìm kiếm',
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Color(0xffBDBDBD)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffBDBDBD),
                          size: 36.0,
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 14, top: 8, bottom: 8),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBDBDBD)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffBDBDBD)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 60,
                  height: 36,
                ),
              )),
              SizedBox(
                child: new FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    debugPrint('on press');
                    setState(() {
                      textController.text = '';
                    });
                  },
                  child: Text(
                    'Huỷ',
                    style: TextStyle(fontSize: 16.0, color: Colors.amber[700]),
                    textAlign: TextAlign.right,
                  ),
                ),
                width: 50.0,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Kết quả tìm kiếm')),
        ),
      ),
    );
  }
}
