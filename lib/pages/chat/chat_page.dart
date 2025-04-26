import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/notification/notification_bell.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PageTitle(
        title: 'chat.title'.tr(),
        hasBackButton: false,
        actions: const [
          NotificationBell(),
        ],
      ),
    );
  }
}
