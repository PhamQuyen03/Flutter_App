import 'package:flutter/material.dart';

typedef void OnPress();

class LayoutBoxResultSearch extends StatelessWidget {
  final Widget childElement;
  final OnPress onPress;
  final double minHeight;

  LayoutBoxResultSearch(
      {Key key, @required this.childElement, this.onPress, this.minHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
      constraints: new BoxConstraints(
        minHeight: minHeight != null ? minHeight : 150,
      ),
      child: Ink(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5, offset: Offset(0, 4), color: Color(0xffdddddd)),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: onPress,
          child: childElement,
        ),
      ),
    );
  }
}
