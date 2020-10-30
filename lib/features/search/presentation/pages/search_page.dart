import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Tim kiem',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Tim kiem',
    //     ),
    //   ),
    //   body: Center(
    //     child: Text('trang tim kiem'),
    //   ),
    // );
  }
}
