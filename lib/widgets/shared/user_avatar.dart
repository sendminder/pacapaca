import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final String fallbackText;
  final double radius;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    required this.fallbackText,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl.isNotEmpty
          ? NetworkImage(imageUrl)
          : const AssetImage('assets/profiles/pacappu.jpeg') as ImageProvider,
    );
  }
}
