import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/features/search_main/presentation/pages/widgets/button_filter.dart';
import 'result_search_page.dart';
import '../model/result_search.dart';
import './widgets/widgets.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
                  SearchBox(
                    textController,
                  ),
                  ButtonFilter(
                    onClick: _showModalSheet,
                  )
                ],
              ),
              bottom: PreferredSize(
                child: SearchBottomTabs(),
                preferredSize: Size.fromHeight(30.0),
              ),
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
