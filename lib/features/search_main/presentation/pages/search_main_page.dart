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

class SearchMainPage extends StatefulWidget {
  @override
  _SearchMainState createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMainPage> {
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
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.white,
              titleSpacing: 0.0,
              title: Row(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 20,
                    padding: new EdgeInsets.all(0.0),
                    child: FlatButton(
                      child: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () => {Navigator.of(context).pop(true)},
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child: TextField(
                          onSubmitted: (String str) {
                            debugPrint('on submit $str');
                          },
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
                  ButtonTheme(
                    minWidth: 20,
                    padding: new EdgeInsets.all(0.0),
                    child: FlatButton(
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.amber[700],
                      ),
                      onPressed: () => {_showModalSheet()},
                    ),
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
