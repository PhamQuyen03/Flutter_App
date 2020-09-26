import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

class Comment {
  final int userId;
  final int likes;
  final int comments;
  final String fullName;
  final String avatar;
  final String commentContent;
  final bool isLiked;
  Comment(
      {this.userId,
      this.likes = 0,
      this.comments = 0,
      this.fullName,
      this.avatar,
      this.commentContent,
      this.isLiked = false});
}

class CommentLine extends StatefulWidget {
  final Comment comment;
  const CommentLine({Key key, @required this.comment}) : super(key: key);

  @override
  _CommentLineState createState() => _CommentLineState();
}

class _CommentLineState extends State<CommentLine> {
  bool isLiked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLiked = widget.comment.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(widget.comment.avatar),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.comment.fullName,
                      style: TextStyle(
                        color: Palette.textDarkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.comment.commentContent),
                  ],
                ),
              ),
              Row(
                children: [
                  ButtonTheme(
                    minWidth: 0,
                    splashColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Text(
                        'Like',
                        style: TextStyle(
                          fontWeight:
                              isLiked ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  ButtonTheme(
                    minWidth: 0,
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text('Comment'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
