import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/presentation/pages/top_students.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                height: 50,
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.orange,
                  size: 40,
                ),
                onPressed: null,
                alignment: Alignment.centerRight,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset(
                'assets/images/banner.jpg',
                fit: BoxFit.cover,
              ),
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
                        onTap: () async {
                          await navigatePopup();
                          // Navigator.of(context).pushNamed('/home/topstudents');
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
