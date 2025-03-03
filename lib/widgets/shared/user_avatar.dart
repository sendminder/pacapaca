import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pacapaca/models/enums/profile_type.dart';
import 'package:go_router/go_router.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final String? profileType;
  final int? userId;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.profileType,
    this.radius = 16,
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final profileType = this.profileType ?? PacapacaProfileType.pacappi.value;

    return GestureDetector(
      onTap: userId != null ? () => context.push('/users/$userId') : null,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: imageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: radius * 2,
                height: radius * 2,
                errorWidget: (context, error, stackTrace) => Container(
                  width: radius * 2,
                  height: radius * 2,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                ),
              )
            : getProfileImage(profileType),
      ),
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
