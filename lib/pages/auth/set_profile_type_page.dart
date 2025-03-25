import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/enums/profile_type.dart';

class SetProfileTypePage extends ConsumerWidget {
  SetProfileTypePage({super.key});
  final logger = GetIt.instance<Logger>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Text(
                'profile.choose_type'.tr(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'profile.question'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: _buildProfileTypeOptions(context, ref),
              ),
              SizedBox(height: screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTypeOptions(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: _ProfileTypeCard(
            title: 'profile.empathy'.tr(),
            description: 'profile.empathy_description'.tr(),
            imagePath: 'assets/profiles/pacappi.jpeg',
            type: PacapacaProfileType.pacappi,
            onTap: () => _selectProfileType(
              ref,
              PacapacaProfileType.pacappi.value,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: _ProfileTypeCard(
            title: 'profile.solution'.tr(),
            description: 'profile.solution_description'.tr(),
            imagePath: 'assets/profiles/pacappu.jpeg',
            type: PacapacaProfileType.pacappu,
            onTap: () => _selectProfileType(
              ref,
              PacapacaProfileType.pacappu.value,
            ),
          ),
        ),
      ],
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
  final PacapacaProfileType type;
  final VoidCallback onTap;

  const _ProfileTypeCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardColor = type == PacapacaProfileType.pacappi
        ? primaryColor.withAlpha(25)
        : secondaryColor.withAlpha(25);

    final borderColor =
        type == PacapacaProfileType.pacappi ? primaryColor : secondaryColor;

    final imageSize = screenHeight * 0.12;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey.shade800.withAlpha(75) : cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor.withAlpha(75),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: borderColor.withAlpha(25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: borderColor.withAlpha(128),
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(imageSize),
                        child: Image.asset(
                          imagePath,
                          height: imageSize,
                          width: imageSize,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: imageSize,
                              width: imageSize,
                              color: borderColor.withAlpha(50),
                              child: Icon(
                                Icons.person,
                                size: imageSize * 0.5,
                                color: borderColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black54,
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: type == PacapacaProfileType.pacappi
                        ? primaryColor
                        : secondaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      type == PacapacaProfileType.pacappi
                          ? 'pacapaca.pacappi'.tr()
                          : 'pacapaca.pacappu'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
