import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/palette.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/result_search.dart';
import '../../pages/result_search_page.dart';

class BoxResult extends StatelessWidget {
  final ResultSearch resultSearch;

  BoxResult({Key key, @required this.resultSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 10),
            constraints: new BoxConstraints(
              minHeight: 45,
            ),
            child: Ink(
              child: InkWell(
                onTap: () {
                  debugPrint('ontab');
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(builder: (BuildContext context) {
                    return ResultSearchPage(
                      textSearch: this.resultSearch.title,
                    );
                  }));
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          resultSearch.title,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          resultSearch.description,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        )
                      ]),
                ),
              ),
            )),
        Divider(
          color: Palette.lightColor,
          height: 1,
          endIndent: 0,
        ),
      ],
    );
  }
}
