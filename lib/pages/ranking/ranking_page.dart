import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/ranking/ranking_section.dart';
import 'package:pacapaca/widgets/ranking/ranking_list_item.dart';
import 'package:pacapaca/providers/point_provider.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/pages/ranking/ranking_type.dart';
import 'package:go_router/go_router.dart';

class RankingPage extends ConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointRankings = ref.watch(pointRankingsProvider);
    final carrotRankings = ref.watch(carrotRankingsProvider);

    final divider = Divider(
      color: Theme.of(context).colorScheme.primary.withAlpha(50),
      height: 2,
    );

    return Scaffold(
      appBar: PageTitle(
        title: 'ranking.title'.tr(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: divider,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(pointRankingsProvider);
          ref.invalidate(carrotRankingsProvider);
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            // 상단 장식
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withAlpha(20),
                      Theme.of(context).colorScheme.primary.withAlpha(20),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ranking.description_title'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ranking.description'.tr(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 포인트 랭킹
            pointRankings.when(
              data: (rankings) => RankingSection(
                title: 'ranking.point_ranking'.tr(),
                items: (rankings ?? [])
                    .map((rank) => RankingListItem(
                          rank: rankings!.indexOf(rank) + 1,
                          nickname: rank.nickname,
                          profileImageUrl: rank.profileImageUrl,
                          score: NumberFormat.compact().format(rank.points),
                          isTopRank: rankings.indexOf(rank) < 3,
                        ))
                    .toList(),
                onViewMore: () => _showRankingDetail(
                  context,
                  'ranking.point_ranking'.tr(),
                  RankingType.point,
                ),
                icon: Icons.stars_outlined,
              ),
              loading: () => RankingSection(
                title: 'ranking.point_ranking'.tr(),
                items: [],
                onViewMore: () {},
                isLoading: true,
                icon: Icons.stars_outlined,
              ),
              error: (error, _) => RankingSection(
                title: 'ranking.point_ranking'.tr(),
                items: [],
                onViewMore: () {},
                errorMessage: error.toString(),
                icon: Icons.stars_outlined,
              ),
            ),

            const SizedBox(height: 16),
            divider,
            const SizedBox(height: 16),

            // 당근 받은 순 랭킹
            carrotRankings.when(
              data: (rankings) => RankingSection(
                title: 'ranking.received_carrots'.tr(),
                items: (rankings?.topReceivers ?? [])
                    .map((ranker) => RankingListItem(
                          rank: rankings!.topReceivers!.indexOf(ranker) + 1,
                          nickname: ranker.nickname,
                          profileImageUrl: ranker.profileImageUrl,
                          score: NumberFormat.compact().format(ranker.carrots),
                          isTopRank: rankings.topReceivers!.indexOf(ranker) < 3,
                        ))
                    .toList(),
                onViewMore: () => _showRankingDetail(
                  context,
                  'ranking.received_carrots'.tr(),
                  RankingType.receivedCarrots,
                ),
                icon: Icons.card_giftcard,
              ),
              loading: () => RankingSection(
                title: 'ranking.received_carrots'.tr(),
                items: [],
                onViewMore: () {},
                isLoading: true,
                icon: Icons.favorite_outline,
              ),
              error: (error, _) => RankingSection(
                title: 'ranking.received_carrots'.tr(),
                items: [],
                onViewMore: () {},
                errorMessage: error.toString(),
                icon: Icons.favorite_outline,
              ),
            ),

            const SizedBox(height: 16),
            divider,
            const SizedBox(height: 16),

            // 당근 준 순 랭킹
            carrotRankings.when(
              data: (rankings) => RankingSection(
                title: 'ranking.sent_carrots'.tr(),
                items: (rankings?.topSenders ?? [])
                    .map((ranker) => RankingListItem(
                          rank: rankings!.topSenders!.indexOf(ranker) + 1,
                          nickname: ranker.nickname,
                          profileImageUrl: ranker.profileImageUrl,
                          score: NumberFormat.compact().format(ranker.carrots),
                          isTopRank: rankings.topSenders!.indexOf(ranker) < 3,
                        ))
                    .toList(),
                onViewMore: () => _showRankingDetail(
                  context,
                  'ranking.sent_carrots'.tr(),
                  RankingType.sentCarrots,
                ),
                icon: Icons.volunteer_activism_outlined,
              ),
              loading: () => RankingSection(
                title: 'ranking.sent_carrots'.tr(),
                items: [],
                onViewMore: () {},
                isLoading: true,
                icon: Icons.volunteer_activism_outlined,
              ),
              error: (error, _) => RankingSection(
                title: 'ranking.sent_carrots'.tr(),
                items: [],
                onViewMore: () {},
                errorMessage: error.toString(),
                icon: Icons.volunteer_activism_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRankingDetail(
    BuildContext context,
    String title,
    RankingType type,
  ) {
    context.push(
      '/ranking/${type.value}',
      extra: title,
    );
  }
}
