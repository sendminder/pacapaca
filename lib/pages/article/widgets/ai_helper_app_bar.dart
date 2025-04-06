import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/enums/profile_type.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiHelperAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSummarize;
  final bool showSummarizeButton;

  const AiHelperAppBar({
    super.key,
    this.onSummarize,
    this.showSummarizeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Row(
        children: [
          UserAvatar(
            radius: 20,
            profileType: PacapacaProfileType.pacappiface.value,
            imageUrl: '',
          ),
          const SizedBox(width: 8),
          Text(
            'helper.title'.tr(),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.pop(),
      ),
      actions: [
        if (showSummarizeButton)
          IconButton(
            onPressed: onSummarize,
            icon: Icon(
              Icons.download_done,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
