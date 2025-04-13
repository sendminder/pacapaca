import 'package:flutter/material.dart';
import 'package:pacapaca/models/enums/profile_type.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final bool isLoading;
  final VoidCallback? onReport;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isLoading = false,
    this.onReport,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isUser
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondaryContainer.withAlpha(160),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(isUser ? 20 : 4),
          bottomRight: Radius.circular(isUser ? 4 : 20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: isUser
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
                fontSize: 15.sp,
              ),
            ),
          ),
          if (isLoading) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 16.w,
              height: 16.h,
              child: RotatingPacaLoader(),
            ),
          ],
        ],
      ),
    );
  }
}

class ChatMessageItem extends StatelessWidget {
  final Map<String, String> message;
  final bool isUser;
  final bool isFirst;
  final bool isLast;
  final bool isLoading;
  final VoidCallback? onReport;

  const ChatMessageItem({
    super.key,
    required this.message,
    required this.isUser,
    this.isFirst = false,
    this.isLast = false,
    this.isLoading = false,
    this.onReport,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 16.h : 12.h,
        top: isFirst ? 8.h : 0.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(),
          Flexible(
            child: Stack(
              children: [
                ChatBubble(
                  message: message[isUser ? 'user' : 'assistant'] ?? '',
                  isUser: isUser,
                  isLoading: isLoading,
                  onReport: onReport,
                ),
              ],
            ),
          ),
          if (!isUser) ...[
            SizedBox(width: 8.w),
            if (!isLoading)
              IconButton(
                icon: const Icon(Icons.flag_outlined),
                onPressed: onReport,
                iconSize: 20.w,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                constraints: BoxConstraints(
                  minWidth: 32.w,
                  minHeight: 32.h,
                ),
                padding: EdgeInsets.zero,
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return UserAvatar(
      radius: 20,
      profileType: PacapacaProfileType.pacappiface.value,
      imageUrl: '',
    );
  }
}
