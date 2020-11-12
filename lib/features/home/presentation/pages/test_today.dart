import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/presentation/widgets/profile_avatar.dart';

class TestToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Hôm nay làm gì?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Palette.neutral_800,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemTestToday();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class ItemTestToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 200),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Đề thi môn Toán tốt nghiệp THPT 2020",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Palette.commonHeading,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "45",
                      style: TextStyle(
                          color: Palette.primaryColor_600, fontSize: 12),
                    ),
                    Icon(
                      Icons.star,
                      color: Palette.primaryColor_600,
                      size: 13,
                    ),
                    Text(
                      "từ 250 lượt đánh giá • 506 lượt làm bài",
                      style:
                          TextStyle(fontSize: 12, color: Palette.neutral_400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.pie_chart,
                            color: Palette.neutral_400,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("90 câu")
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Palette.neutral_400,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Toán 12")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.pie_chart,
                            color: Palette.neutral_400,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("180 phút")
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Palette.primaryColor_600,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("500 xu")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Palette.scaffold,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          ProfileAvatar(
                            imageUrl:
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              "Pham Ngoc Phi",
                              style: TextStyle(
                                  color: Palette.neutral_800, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Ngày đăng",
                            style: TextStyle(
                                fontSize: 12, color: Palette.neutral_600),
                          ),
                          Text(
                            "20/10/2020",
                            style: TextStyle(
                                fontSize: 12, color: Palette.neutral_800),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
