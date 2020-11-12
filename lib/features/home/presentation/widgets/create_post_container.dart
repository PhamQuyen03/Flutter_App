import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';
import 'package:flutter_app/features/home/data/model/user.dart';
import 'package:flutter_app/features/home/presentation/widgets/profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8, 12, 20),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Palette.neutral_200,
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Bạn đang nghĩ gì?',
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
