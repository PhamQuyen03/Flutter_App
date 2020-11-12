import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/data/model/dummy.dart';
import 'package:flutter_app/features/home/presentation/pages/top_students.dart';
import 'package:flutter_app/features/home/presentation/widgets/create_post_container.dart';
import 'package:flutter_app/features/home/presentation/widgets/test_suggest.dart';

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
            child: TestSuggest(
              tests: testSuggests,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 800,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return NewBox();
                },
                itemCount: 10,
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
