import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/auth_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('프로필 설정'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('알림 설정'),
          ),
          const ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('테마 설정'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('로그아웃', style: TextStyle(color: Colors.red)),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('로그아웃'),
                  content: const Text('정말 로그아웃 하시겠습니까?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('취소'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        '로그아웃',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                // 로그아웃 처리
                await ref.read(authServiceProvider).signOut();
                if (context.mounted) {
                  context.go('/login'); // 로그인 페이지로 이동
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
