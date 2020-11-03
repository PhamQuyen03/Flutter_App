import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'result_search_page.dart';
import '../model/result_search.dart';

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      // height: 400,
      color: Colors.transparent,
      child: Column(
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
                'Header',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('item $index '),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  var textController = new TextEditingController();

  void _showModalSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        context: context,
        builder: (builder) {
          return _BottomSheetContent();
        });
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
                            hintStyle: TextStyle(
                                fontSize: 20.0, color: Color(0xffBDBDBD)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xffBDBDBD),
                              size: 36.0,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 14, top: 8, bottom: 8),
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
                        _showModalSheet();
                        setState(() {
                          textController.text = '';
                        });
                      },
                      child: Text(
                        'Huỷ',
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.amber[700]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    width: 50.0,
                  ),
                ],
              ),
              bottom: PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.amber[700],
                      labelColor: Colors.amber[700],
                      tabs: [
                        Tab(
                          child: Text(
                            'Mọi người',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Nhóm',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Bài tập',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Game',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Tab 5',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Tab 6',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                  preferredSize: Size.fromHeight(30.0)),
              // actions: <Widget>[
              //   Padding(
              //     padding: const EdgeInsets.only(right: 16.0),
              //     child: Icon(Icons.add_alert),
              //   ),
              // ],
            ),
            body: TabBarView(children: [
              ResultSearchPage(
                resultSearches: List.generate(
                  20,
                  (i) => ResultSearch(
                    'Moi nguoi ${i + 1}',
                    'A description of what needs to be done for Moi nguoi ${i + 1}',
                  ),
                ),
              ),
              ResultSearchPage(
                resultSearches: List.generate(
                  20,
                  (i) => ResultSearch(
                    'Nhom ${i + 1}',
                    'A description of what needs to be done for nhoms ${i + 1}',
                  ),
                ),
              ),
              ResultSearchPage(
                resultSearches: List.generate(
                  20,
                  (i) => ResultSearch(
                    'Bai tap ${i + 1}',
                    'A description of what needs to be done for bai tap ${i + 1}',
                  ),
                ),
              ),
              ResultSearchPage(
                resultSearches: List.generate(
                  20,
                  (i) => ResultSearch(
                    'Game ${i + 1}',
                    'A description of what needs to be done for Game ${i + 1}',
                  ),
                ),
              ),
              ResultSearchPage(
                resultSearches: List.generate(
                  20,
                  (i) => ResultSearch(
                    'Tab 5 ${i + 1}',
                    'A description of what needs to be done for tab 5 ${i + 1}',
                  ),
                ),
              ),
              ResultSearchPage(
                resultSearches: List.generate(
                  20,
                  (i) => ResultSearch(
                    'Tab 6 ${i + 1}',
                    'A description of what needs to be done for Tab 6 ${i + 1}',
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
