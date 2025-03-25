import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/enums/profile_type.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';

class AiHelperAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AiHelperAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          UserAvatar(
            radius: 20,
            profileType: PacapacaProfileType.pacappiface.value,
            imageUrl: '',
          ),
          const SizedBox(width: 8),
          Text('helper.title'.tr()),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
