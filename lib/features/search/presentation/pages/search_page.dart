import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import '../data/models/result_search.dart';
import '../widgets/box_result_search/box_result.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  ScrollController controller;
  List<ResultSearch> resultSearches = [];
  var textController = new TextEditingController();

  // useEffect(()=> {}, [])
  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @protected
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 100) {
      List<ResultSearch> test = [
        ...resultSearches,
        ...List.generate(
            30,
            (index) => ResultSearch(
                  'Ket qua tim kiem ${textController.text} ${resultSearches.length + index + 1}',
                  'Noi dung ket qua tim kiem ${textController.text} ${resultSearches.length + index + 1}',
                ))
      ];
      this.setState(() {
        resultSearches = test;
      });
    }
  }

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
        child: DefaultTabController(
          length: 6,
          child: Scaffold(
              appBar: AppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                title: Row(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 20,
                      padding: new EdgeInsets.all(0.0),
                      child: FlatButton(
                        child: Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () => {Navigator.of(context).pop(false)},
                      ),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextField(
                            onSubmitted: (String str) {
                              setState(() {
                                resultSearches = List.generate(
                                  20,
                                  (i) => ResultSearch(
                                    'Ket qua tim kiem $str ${i + 1}',
                                    'Noi dung ket qua tim kiem $str ${i + 1}',
                                  ),
                                );
                              });
                              debugPrint('on submit $str');
                            },
                            controller: textController,
                            autofocus: true,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Tìm kiếm',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xffBDBDBD)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xffBDBDBD),
                                size: 36.0,
                              ),
                              suffixIcon: SizedBox(
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    setState(() {
                                      textController.text = '';
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Color(0xffBDBDBD),
                                    size: 20.0,
                                  ),
                                ),
                                width: 30.0,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 14, top: 8, bottom: 8),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffBDBDBD)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffBDBDBD)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width - 60,
                        height: 36,
                      ),
                    )),
                  ],
                ),
              ),
              body: Container(
                margin: const EdgeInsets.only(top: 4),
                child: ListView.builder(
                    controller: controller,
                    itemCount: resultSearches.length,
                    itemBuilder: (context, index) {
                      return BoxResult(resultSearch: resultSearches[index]);
                    }),
              )),
        ));
  }
}
