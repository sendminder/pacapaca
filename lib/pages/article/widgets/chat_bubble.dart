import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final bool isLoading;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isLoading = false,
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
            : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(isUser ? 20 : 4),
          bottomRight: Radius.circular(isUser ? 4 : 20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                    : Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 15,
              ),
            ),
          ),
          if (isLoading) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 16,
              height: 16,
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

  const ChatMessageItem({
    super.key,
    required this.message,
    required this.isUser,
    this.isFirst = false,
    this.isLast = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 16.0 : 12.0,
        top: isFirst ? 8.0 : 0.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) ...[
            _buildAvatar(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChatBubble(
                    message: message[isUser ? 'user' : 'assistant']?.tr() ?? '',
                    isUser: isUser,
                    isLoading: isLoading,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
          ] else ...[
            const SizedBox(width: 50),
            Flexible(
              child: ChatBubble(
                message: message[isUser ? 'user' : 'assistant'] ?? '',
                isUser: isUser,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/profiles/pacappiface.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
