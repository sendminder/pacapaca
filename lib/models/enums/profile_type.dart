import 'package:easy_localization/easy_localization.dart';

enum PacapacaProfileType {
  pacappi,
  pacappu,
  pacappiface,
  pacappuface;

  String get label {
    return switch (this) {
      PacapacaProfileType.pacappi => 'pacapaca.pacappi'.tr(),
      PacapacaProfileType.pacappu => 'pacapaca.pacappu'.tr(),
      PacapacaProfileType.pacappiface => 'pacapaca.pacappiface'.tr(),
      PacapacaProfileType.pacappuface => 'pacapaca.pacappuface'.tr(),
    };
  }

  String get value => name;
}
