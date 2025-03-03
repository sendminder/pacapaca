import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/ranking/ranking_list_item.dart';
import 'package:pacapaca/providers/point_provider.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/pages/ranking/ranking_type.dart';
import 'package:flutter/material.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/page_title.dart';

class RankingDetailPage extends ConsumerWidget {
  final String title;
  final RankingType type;

  const RankingDetailPage({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PageTitle(
        title: title,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          switch (type) {
            case RankingType.point:
              ref.invalidate(pointRankingsProvider);
              break;
            case RankingType.receivedCarrots:
            case RankingType.sentCarrots:
              ref.invalidate(carrotRankingsProvider);
              break;
          }
        },
        child: _buildRankingList(ref),
      ),
    );
  }

  Widget _buildRankingList(WidgetRef ref) {
    switch (type) {
      case RankingType.point:
        final rankings = ref.watch(pointRankingsProvider);
        return rankings.when(
          data: (data) => _buildListView(
            items: data
                    ?.map((rank) => RankingListItem(
                          rank: data.indexOf(rank) + 1,
                          nickname: rank.nickname,
                          profileImageUrl: rank.profileImageUrl,
                          profileType: rank.profileType,
                          userId: rank.id,
                          score: NumberFormat.compact().format(rank.points),
                        ))
                    .toList() ??
                [],
          ),
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, _) => Center(
            child: Text('ranking.error'.tr(args: [error.toString()])),
          ),
        );

      case RankingType.receivedCarrots:
        final rankings = ref.watch(carrotRankingsProvider);
        return rankings.when(
          data: (data) => _buildListView(
            items: data?.topReceivers
                    ?.map((ranker) => RankingListItem(
                          rank: data.topReceivers!.indexOf(ranker) + 1,
                          nickname: ranker.nickname,
                          profileImageUrl: ranker.profileImageUrl,
                          profileType: ranker.profileType,
                          userId: ranker.id,
                          score: NumberFormat.compact().format(ranker.carrots),
                        ))
                    .toList() ??
                [],
          ),
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, _) => Center(
            child: Text('ranking.error'.tr(args: [error.toString()])),
          ),
        );

      case RankingType.sentCarrots:
        final rankings = ref.watch(carrotRankingsProvider);
        return rankings.when(
          data: (data) => _buildListView(
            items: data?.topSenders
                    ?.map((ranker) => RankingListItem(
                          rank: data.topSenders!.indexOf(ranker) + 1,
                          nickname: ranker.nickname,
                          profileImageUrl: ranker.profileImageUrl,
                          profileType: ranker.profileType,
                          userId: ranker.id,
                          score: NumberFormat.compact().format(ranker.carrots),
                        ))
                    .toList() ??
                [],
          ),
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, _) => Center(
            child: Text('ranking.error'.tr(args: [error.toString()])),
          ),
        );
    }
  }

  Widget _buildListView({required List<RankingListItem> items}) {
    if (items.isEmpty) {
      return Center(
        child: Text('ranking.no_data'.tr()),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(
        height: 30,
        color: Theme.of(context).colorScheme.primary.withAlpha(50),
      ),
      itemBuilder: (context, index) => items[index],
    );
  }
}
