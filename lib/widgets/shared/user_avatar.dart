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

    return Container(
      width: radius * 2,
      height: radius * 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: radius * 2,
              height: radius * 2,
            )
          : getProfileImage(profileType),
    );
  }

  Widget getProfileImage(String profileType) {
    final bool isFaceType =
        profileType == PacapacaProfileType.pacappiface.value ||
            profileType == PacapacaProfileType.pacappuface.value;

    final double containerSize = radius * 2;
    final double imageSize =
        isFaceType ? containerSize * 0.75 : containerSize; // 컨테이너 크기 기준으로 계산
    final String extension = isFaceType ? 'png' : 'jpeg';

    return Center(
      child: SizedBox(
        width: imageSize,
        height: imageSize,
        child: Image.asset(
          'assets/profiles/$profileType.$extension',
          fit: isFaceType ? BoxFit.contain : BoxFit.cover,
        ),
      ),
    );
  }
}
