import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 25, 40, 24),
      margin: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff888888),
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/images/box_tag_1.png'),
            fit: BoxFit.fill,
          )),
      child: Center(
        child: Text(
          questionText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
