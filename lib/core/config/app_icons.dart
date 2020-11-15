import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcon { test, graph, duration, coin }

Widget getImage(AppIcon icon) {
  switch (icon) {
    case AppIcon.test:
      return SvgPicture.asset('assets/icons/test.svg');
    case AppIcon.graph:
      return SvgPicture.asset('assets/icons/Graph.svg');
    case AppIcon.duration:
      return SvgPicture.asset('assets/icons/TimeCircle.svg');
    case AppIcon.coin:
      return Image.asset('assets/icons/coin.png');
    default:
      return SvgPicture.asset('assets/icons/test.svg');
  }
}
