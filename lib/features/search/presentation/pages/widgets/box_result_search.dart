import 'package:flutter/material.dart';
import '../../model/result_search.dart';
import './row_info_box_result.dart';
import './header_box_result.dart';

class BoxResultSearch extends StatelessWidget {
  final ResultSearch resultSearch;

  BoxResultSearch({Key key, @required this.resultSearch}) : super(key: key);

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
                          'ulr image', 'Pham The Quyen', 'Hoc sinh - THPT ABC'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Column(children: [
                              RowInfoBoxResult(
                                  Icon(
                                    Icons.place,
                                    color: Colors.black54,
                                  ),
                                  'Dia chi'),
                              RowInfoBoxResult(
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black54,
                                  ),
                                  'Bai tap'),
                              RowInfoBoxResult(
                                  Icon(
                                    Icons.people_rounded,
                                    color: Colors.black54,
                                  ),
                                  'Nguoi theo doi'),
                            ]),
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          OutlineButton(
                              borderSide: BorderSide(color: Colors.amber[700]),
                              onPressed: () {
                                print('Received click');
                              },
                              child: Text('Click Me'),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0)))
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
