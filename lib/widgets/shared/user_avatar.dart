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
      child: ClipOval(
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
              )
            : getProfileImage(profileType),
      ),
    );
  }

  Widget getProfileImage(String profileType) {
    final bool isFaceType =
        profileType == PacapacaProfileType.pacappiface.value ||
            profileType == PacapacaProfileType.pacappuface.value;

    final double size = isFaceType ? radius * 1.6 : radius * 2; // face 타입은 더 작게
    final String extension = isFaceType ? 'png' : 'jpeg';

    return Image.asset(
      'assets/profiles/$profileType.$extension',
      fit: isFaceType ? BoxFit.contain : BoxFit.cover,
      width: size,
      height: size,
    );
  }
}
