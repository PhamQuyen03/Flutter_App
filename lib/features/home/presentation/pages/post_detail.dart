import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/presentation/widgets/comment_line.dart';
import 'package:flutter_app/features/home/presentation/widgets/new_box_bottom.dart';
import 'package:flutter_app/features/home/presentation/widgets/new_box_header.dart';
import '../widgets/widgets.dart';

class PostDetailModel {
  final String postContent;
  final String fullName;
  final String avatar;
  final int userId;
  final int likes;
  final int comments;

  PostDetailModel(
      {this.postContent,
      this.fullName,
      this.avatar,
      this.userId,
      this.likes,
      this.comments});
}

class PostDetail extends StatefulWidget {
  final PostDetailModel post;
  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  TextEditingController _textController = new TextEditingController();
  final _scrollController = ScrollController();
  List<Comment> comments;
  @override
  void initState() {
    super.initState();
    loadComment();
    //_textController = TextEditingController(text: '');
  }

  loadComment() {
    comments = new List<Comment>();
    comments.addAll([
      new Comment(
        userId: 1,
        fullName: "Đặng Minh Được",
        commentContent: "Whatever you do, I will still love you",
        avatar: "assets/images/kid.png",
        comments: 1,
        likes: 1,
      ),
      new Comment(
        userId: 1,
        fullName: "Đặng Minh Được",
        commentContent: "Whatever you do, I will still love you",
        avatar: "assets/images/kid.png",
        comments: 1,
        likes: 1,
      ),
      new Comment(
        userId: 1,
        fullName: "Đặng Minh Được",
        commentContent: "Whatever you do, I will still love you",
        avatar: "assets/images/kid.png",
        comments: 1,
        likes: 1,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.lightPrimaryColor,
          title: Text('Comment'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          NewBoxHeader(
                            fullName: 'Nguyễn Minh Tuấn',
                            timeAgo: "15 min ago",
                            avatar: "",
                            userId: 1,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          NewBoxBottom(
                            isLiked: true,
                            totalLikes: 10,
                            totalComments: 8,
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListView.builder(
                      itemCount: comments.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return CommentLine(
                          comment: comments[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        controller: _textController,
                        autofocus: true,
                        placeholder: "Nhập bình luận",
                        onSubmitted: (val) => _onSubmitComment(),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.send), onPressed: _onSubmitComment)
                  ],
                ),
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              height: MediaQuery.of(context).viewInsets.bottom,
              color: Colors.black,
            ),
          ],
        ));
  }

  _onSubmitComment() {
    if (_textController.value.text.length == 0) return;
    setState(() {
      comments.add(new Comment(
        userId: 1,
        fullName: "Đặng Minh Được",
        commentContent: _textController.value.text,
        avatar: "assets/images/kid.png",
        comments: 1,
        likes: 1,
      ));
      _textController.clear();
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(microseconds: 500), curve: Curves.ease);
    });
  }
}
