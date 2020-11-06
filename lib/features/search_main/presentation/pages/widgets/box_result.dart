import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/core/config/palette.dart';
import '../../model/result_search.dart';

class BoxResult extends StatelessWidget {
  final ResultSearch resultSearch;

  BoxResult({Key key, @required this.resultSearch}) : super(key: key);

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
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.pink[200],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ho ten',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                ),
                                Text(
                                  'Loai thanh vien - truong hoc',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Column(children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.place,
                                    color: Colors.black54,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dia chi ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black54,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Bai tap ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people_rounded,
                                    color: Colors.black54,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nguoi theo doi ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
