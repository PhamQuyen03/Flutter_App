import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'danh sach bai tap',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
