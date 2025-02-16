import 'package:easy_localization/easy_localization.dart';

enum ArticleCategory {
  all, // 전체
  work, // 직장
  love, // 연애
  family, // 가족
  mental, // 정신건강
  study, // 학업/진로
  daily; // 일상/기타

  String get label {
    return switch (this) {
      ArticleCategory.all => 'category.all'.tr(),
      ArticleCategory.work => 'category.work'.tr(),
      ArticleCategory.love => 'category.love'.tr(),
      ArticleCategory.family => 'category.family'.tr(),
      ArticleCategory.mental => 'category.mental'.tr(),
      ArticleCategory.study => 'category.study'.tr(),
      ArticleCategory.daily => 'category.daily'.tr(),
    };
  }

  static List<ArticleCategory> valuesWithoutAll = ArticleCategory.values
      .where((category) => category != ArticleCategory.all)
      .toList();
}
