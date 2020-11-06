import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../model/result_search.dart';
import '../../../../search_main/presentation/pages/search_main_page.dart';

class BoxResult extends StatelessWidget {
  final ResultSearch resultSearch;

  BoxResult({Key key, @required this.resultSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
        child: Ink(
          height: 46,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 4),
                  color: Color(0xffdddddd)),
            ],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              debugPrint('ontab');
              Navigator.of(context, rootNavigator: true)
                  .push(CupertinoPageRoute(builder: (BuildContext context) {
                return SearchMainPage();
              }));
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SearchMainPage()));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      resultSearch.title,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
