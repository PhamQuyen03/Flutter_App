import 'package:meta/meta.dart';

class User {
  final String name;
  final String imageUrl;
  final bool isOnline;

  const User({
    @required this.name,
    @required this.imageUrl,
    this.isOnline = false,
  });
}