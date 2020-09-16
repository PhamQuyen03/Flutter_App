import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answer;
  Answer(this.selectHandler, this.answer);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: GestureDetector(
          child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(bottom: 15),
              child: Center(
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage("assets/images/box_tag_1.png"),
                    fit: BoxFit.fill),
              )),
          onTap: selectHandler),
    );
  }
}
