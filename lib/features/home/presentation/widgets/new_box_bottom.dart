import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class NewBoxBottom extends StatefulWidget {
  int totalLikes;
  int totalComments;
  bool isLiked;
  final int postId;
  NewBoxBottom(
      {@required this.isLiked,
      @required this.totalLikes,
      @required this.totalComments,
      this.postId});
  @override
  _NewBoxBottomState createState() => _NewBoxBottomState();
}

class _NewBoxBottomState extends State<NewBoxBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FlatButton.icon(
            padding: EdgeInsets.zero,
            textColor: widget.isLiked
                ? Palette.secondColor
                : Theme.of(context).textTheme.subtitle2.color,
            onPressed: () {
              setState(() {
                widget.isLiked = !widget.isLiked;
                if (widget.isLiked)
                  widget.totalLikes++;
                else
                  widget.totalLikes--;
              });
            },
            icon: Icon(Icons.star),
            label: Text(
              '${widget.totalLikes} Lượt thích',
            ),
          ),
          FlatButton.icon(
            padding: EdgeInsets.zero,
            textColor: Theme.of(context).textTheme.subtitle2.color,
            onPressed: () {
              Navigator.of(context).pushNamed('/post/detail');
            },
            icon: Icon(FontAwesomeIcons.comment),
            label: Text(
              '${widget.totalComments} Bình luận',
            ),
          ),
        ],
      ),
    );
  }
}
