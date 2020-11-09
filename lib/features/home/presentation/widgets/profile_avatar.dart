import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  ProfileAvatar({
    @required this.imageUrl,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        isActive ? Positioned(
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: Palette.onlineState,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Colors.white,
              ),
            ),
          ),
          bottom: 0.0,
          right: 0.0,
        ) : const SizedBox.shrink()
      ],
    );
  }
}
