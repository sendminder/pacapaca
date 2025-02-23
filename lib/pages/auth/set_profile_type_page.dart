import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SetProfileTypePage extends ConsumerWidget {
  const SetProfileTypePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (prev, next) {
      if (next is AsyncData && next.value != null) {
        context.go('/articles');
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('profile.error'.tr())),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('profile.choose_type'.tr()),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'profile.question'.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _ProfileTypeCard(
              title: 'profile.empathy'.tr(),
              description: 'profile.empathy_description'.tr(),
              imagePath: 'assets/profiles/pacappi.jpeg',
              onTap: () => _selectProfileType(ref, 'PACAPPI'),
              isLoading: ref.watch(authProvider).isLoading,
            ),
            const SizedBox(height: 16),
            _ProfileTypeCard(
              title: 'profile.solution'.tr(),
              description: 'profile.solution_description'.tr(),
              imagePath: 'assets/profiles/pacappu.jpeg',
              onTap: () => _selectProfileType(ref, 'PACAPPU'),
              isLoading: ref.watch(authProvider).isLoading,
            ),
          ],
        ),
      ),
    );
  }

  void _selectProfileType(WidgetRef ref, String type) {
    ref.read(authProvider.notifier).updateProfileType(type);
  }
}

class _ProfileTypeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;
  final bool isLoading;

  const _ProfileTypeCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
