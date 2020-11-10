import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/data/model/test_suggest.dart';
import 'package:flutter_app/features/home/presentation/widgets/profile_avatar.dart';

class TestSuggest extends StatelessWidget {
  final List<Test> tests;

  const TestSuggest({Key key, this.tests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hôm nay làm gì?',
            style: TextStyle(
                fontSize: 16,
                color: Palette.commonHeading,
                fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ItemTestSuggest(
                    test: tests[index],
                  ),
                );
              },
              itemCount: tests.length,
            ),
          ),
          FlatButton(
            minWidth: double.infinity,
            textColor: Palette.primaryColor_400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
            onPressed: () => print('Hello'),
            color: Palette.primaryColor_100,
            child: Text(
              'Hiển thị thêm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemTestSuggest extends StatelessWidget {
  final Test test;

  const ItemTestSuggest({Key key, this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.0,
          color: Palette.commonBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            test.tittle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Palette.commonHeading,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                test.star.toString(),
                style: TextStyle(color: Palette.primaryColor_600, fontSize: 12),
              ),
              Icon(
                Icons.star,
                color: Palette.primaryColor_600,
                size: 13,
              )
            ],
          ),
          Text(
            "từ ${test.reviewCount} lượt đánh giá •",
            style: TextStyle(fontSize: 12, color: Palette.neutral_400),
          ),
          Text(
            "${test.studentCount} lượt làm bài",
            style: TextStyle(fontSize: 12, color: Palette.neutral_400),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Palette.neutral_800,
                size: 16,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                test.createdDate,
                style: TextStyle(color: Palette.neutral_800, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Icon(
                Icons.monetization_on_rounded,
                color: Palette.primaryColor_600,
                size: 16,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "${test.price} xu",
                style: TextStyle(color: Palette.neutral_800, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              ProfileAvatar(
                imageUrl: test.createdBy.imageUrl,
                isActive: test.createdBy.isOnline,
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  test.createdBy.name,
                  style: TextStyle(color: Palette.neutral_800, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
