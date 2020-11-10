import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/core/config/palette.dart';
import '../data/models/result_search.dart';
import './row_info_box_result.dart';
import './header_box_result.dart';
import '../data/models/tab_bar_search_model.dart';

class BoxResultSearch extends StatelessWidget {
  final ResultSearch resultSearch;
  final TabBarSearchModel tab;
  final formatterNumber = new NumberFormat("#,###");

  BoxResultSearch({Key key, @required this.resultSearch, @required this.tab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
      child: Ink(
        height: 152,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5, offset: Offset(0, 4), color: Color(0xffdddddd)),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {
            debugPrint('ontab');
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(children: <Widget>[
                      HeaderBoxResult(
                          'ulr image',
                          'Pham The Quyen - ${tab.name}',
                          'Hoc sinh - THPT ABC'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Column(children: [
                              RowInfoBoxResult(
                                  Icon(
                                    Icons.place,
                                    color: Palette.iconInactive,
                                  ),
                                  'Yen Khanh, Ninh Binh'),
                              RowInfoBoxResult(
                                  Icon(
                                    Icons.assignment,
                                    color: Palette.iconInactive,
                                  ),
                                  'Lop 12'),
                              RowInfoBoxResult(
                                  Icon(
                                    Icons.people_rounded,
                                    color: Palette.iconInactive,
                                  ),
                                  formatterNumber.format(1234) +
                                      ' nguoi theo doi'),
                            ]),
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 60,
                              child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: Colors.amber[700]),
                                  onPressed: () {
                                    print('Received click');
                                  },
                                  child: Text(
                                    'Đang theo doi',
                                    style: new TextStyle(fontSize: 12),
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(8.0)))),
                        ],
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
