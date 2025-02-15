import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              StatefulNavigationShell.of(context).goBranch(2);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final userAsyncValue = ref.watch(authStateProvider);

                return userAsyncValue.when(
                  data: (user) => user != null
                      ? Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.person, size: 40),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'home.welcome'.tr(args: [
                                user.nickname ?? 'home.unknown_user'.tr()
                              ]),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 32),
                          ],
                        )
                      : Text('home.login_required'.tr()),
                  error: (error, _) =>
                      Text('home.error'.tr(args: [error.toString()])),
                  loading: () => const CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
