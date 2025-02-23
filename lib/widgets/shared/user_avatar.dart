import 'package:flutter/material.dart';
import 'package:pacapaca/models/enums/profile_type.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final String? profileType;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.profileType,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final profileType = this.profileType ?? PacapacaProfileType.pacappi.value;

    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl.isNotEmpty
          ? NetworkImage(imageUrl)
          : AssetImage('assets/profiles/$profileType.jpeg') as ImageProvider,
    );
  }
}
