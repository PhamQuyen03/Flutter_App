import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/app_icons.dart';
import 'package:flutter_app/core/config/palette.dart';

class RowInfoBoxItemModel {
  final AppIcon icon;
  final String title;
  final int flex;

  RowInfoBoxItemModel(
      {@required this.icon, @required this.title, this.flex = 1});
}

class RowInfoBoxResult extends StatelessWidget {
  final List<RowInfoBoxItemModel> items;
  final bool isStandAlone;
  const RowInfoBoxResult({Key key, this.items, this.isStandAlone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.isStandAlone
        ? Column(
            children: _buildList(),
          )
        : Row(
            children: _buildList(),
          );
  }

  List<Widget> _buildList() {
    List<Widget> _item = new List<Widget>();
    if (this.isStandAlone) {
      items.forEach((item) {
        _item
          ..add(_RowItem(
            title: item.title,
            icon: item.icon,
          ));
      });
    } else {
      items.forEach((item) {
        _item
          ..add(_FlexRowItem(
            title: item.title,
            icon: item.icon,
            flex: item.flex,
          ));
      });
    }

    return _item;
  }
}

class _FlexRowItem extends StatelessWidget {
  _FlexRowItem({@required this.icon, @required this.title, this.flex});
  final AppIcon icon;
  final String title;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: this.flex,
      child: _RowItem(
        icon: this.icon,
        title: this.title,
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({@required this.icon, @required this.title});
  final AppIcon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getImage(icon),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(color: Palette.textBlack, fontSize: 14),
            ),
          )),
        ],
      ),
    );
  }
}
