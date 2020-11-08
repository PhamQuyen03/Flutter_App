import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/result_search.dart';
import './widgets/widgets.dart';

class ResultSearchPage extends StatefulWidget {
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearchPage> {
  var textController = new TextEditingController();
  var resultSearches = List.generate(
    20,
    (i) => ResultSearch(
      'Ket qua tim kiem ${i + 1}',
      'Noi dung ket qua tim kiem ${i + 1}',
    ),
  );

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
          return BottomSheetContent();
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
              body: TabBarViewPage(resultSearches)),
        ));
  }
}
