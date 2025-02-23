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

    return Scaffold(
      appBar: PageTitle(title: 'ranking.title'.tr()),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(pointRankingsProvider);
          ref.invalidate(carrotRankingsProvider);
        },
        child: ListView(
          children: [
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
                        ))
                    .toList(),
                onViewMore: () => _showRankingDetail(
                  context,
                  'ranking.point_ranking'.tr(),
                  RankingType.point,
                ),
              ),
              loading: () => RankingSection(
                title: 'ranking.point_ranking',
                items: [],
                onViewMore: () {},
                isLoading: true,
              ),
              error: (error, _) => RankingSection(
                title: 'ranking.point_ranking'.tr(),
                items: [],
                onViewMore: () {},
                errorMessage: error.toString(),
              ),
            ),

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
                        ))
                    .toList(),
                onViewMore: () => _showRankingDetail(
                  context,
                  'ranking.received_carrots'.tr(),
                  RankingType.receivedCarrots,
                ),
              ),
              loading: () => RankingSection(
                title: 'ranking.received_carrots',
                items: [],
                onViewMore: () {},
                isLoading: true,
              ),
              error: (error, _) => RankingSection(
                title: 'ranking.received_carrots'.tr(),
                items: [],
                onViewMore: () {},
                errorMessage: error.toString(),
              ),
            ),

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
                        ))
                    .toList(),
                onViewMore: () => _showRankingDetail(
                  context,
                  'ranking.sent_carrots'.tr(),
                  RankingType.sentCarrots,
                ),
              ),
              loading: () => RankingSection(
                title: 'ranking.sent_carrots',
                items: [],
                onViewMore: () {},
                isLoading: true,
              ),
              error: (error, _) => RankingSection(
                title: 'ranking.sent_carrots'.tr(),
                items: [],
                onViewMore: () {},
                errorMessage: error.toString(),
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
