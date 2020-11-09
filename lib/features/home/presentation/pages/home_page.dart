import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/data/model/dummy.dart';
import 'package:flutter_app/features/home/presentation/pages/top_students.dart';
import 'package:flutter_app/features/home/presentation/widgets/create_post_container.dart';
import 'package:flutter_app/features/home/presentation/widgets/test_suggest.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/new_box.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            floating: true,
            title: const Text(
              'Trang chủ',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Palette.commonHeading,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 16, 10),
                child: Ink(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Palette.primaryColor_600,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    //Something large to ensure a circle
                    onTap: () => print('Search'),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.search,
                        size: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverToBoxAdapter(
            child: TestSuggest(),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'THÔNG BÁO',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Palette.textDarkBlue,
                          ),
                        ),
                        Ink(
                          height: 46,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                  color: Color(0xffdddddd)),
                            ],
                            borderRadius: BorderRadius.circular(23),
                            color: Palette.scaffold,
                          ),
                          child: InkWell(
                            onTap: () {
                              //await navigatePopup();
                              Navigator.of(context, rootNavigator: true).push(
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) {
                                return TopStudentsPage();
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      'Bảng xếp hạng',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.trophy,
                                    size: 16,
                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      NewBox(),
                      NewBox(),
                      NewBox(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future navigatePopup() async {
    await Navigator.of(context, rootNavigator: true).push(// ensures fullscreen
        CupertinoPageRoute(builder: (BuildContext context) {
      return TopStudentsPage();
    }));
  }
//   Navigator.of(context).push(new MaterialPageRoute<Null>(
//   builder: (BuildContext context) {
//     return new AddEntryDialog();
//   },
//   fullscreenDialog: true
// ));
}
