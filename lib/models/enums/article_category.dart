import 'package:easy_localization/easy_localization.dart';

enum ArticleCategory {
  all, // 전체
  daily, // 일상
  love, // 연애
  work, // 직장
  family; // 가족

  String get label {
    return switch (this) {
      ArticleCategory.all => 'category.all'.tr(),
      ArticleCategory.daily => 'category.daily'.tr(),
      ArticleCategory.love => 'category.love'.tr(),
      ArticleCategory.work => 'category.work'.tr(),
      ArticleCategory.family => 'category.family'.tr(),
    };
  }

  static List<ArticleCategory> valuesWithoutAll = ArticleCategory.values
      .where((category) => category != ArticleCategory.all)
      .toList();
}
