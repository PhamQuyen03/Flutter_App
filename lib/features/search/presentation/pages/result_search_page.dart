import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/features/search/presentation/widgets/widgets.dart';
import '../data/models/result_search.dart';
import '../data/models/tab_bar_search_model.dart';
import '../widgets/filter/widgets.dart';
import '../widgets/tab_bar/widgets.dart';

class ResultSearchPage extends StatefulWidget {
  final String textSearch;

  const ResultSearchPage({Key key, @required this.textSearch})
      : super(key: key);
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearchPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int currentIndex;
  var textController = new TextEditingController();
  var tabsBar = [
    TabBarSearchModel(1, 'Mọi Người', 'people'),
    TabBarSearchModel(2, 'Nhóm', 'group'),
    TabBarSearchModel(3, 'Bài Tập', 'excersice'),
    TabBarSearchModel(4, 'Game', 'game'),
  ];

  @override
  void initState() {
    super.initState();
    tabController =
        new TabController(vsync: this, length: tabsBar.length, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _showModalSheet() {
    showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        context: context,
        builder: (builder) {
          switch (tabController.index) {
            case 0:
              return BottomSheetPeople();
              break;
            case 1:
              return BottomSheetGroup();
              break;
            case 2:
              return BottomSheetExcersices();
              break;
            default:
              return BottomSheetContent();
          }
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
          length: tabsBar.length,
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
                  child: SearchBottomTabs(
                    tabs: tabsBar,
                    tabController: tabController,
                  ),
                  preferredSize: Size.fromHeight(30.0),
                ),
              ),
              body: TabBarViewPage(
                tabs: tabsBar,
                tabController: tabController,
              )),
        ));
  }
}
