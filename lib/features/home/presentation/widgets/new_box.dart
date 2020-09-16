import 'package:flutter/material.dart';
import './new_box_header.dart';
import './new_box_bottom.dart';
import '../../../../styles.dart';

class NewBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffffffff),
      elevation: 1,
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Column(
          children: [
            NewBoxHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LỚP MÌNH VỪA ĐƯỢC GIAO BÀI TẬP MỚI!!',
                    style: TextStyle(
                        color: Color(0xff294267),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  ),
                ],
              ),
            ),
            NewBoxBottom(
              isLiked: true,
              totalLikes: 10,
              totalComments: 8,
            ),
          ],
        ),
      ),
    );
  }
}
