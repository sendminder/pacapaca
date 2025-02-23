import 'package:easy_localization/easy_localization.dart';

enum PacapacaProfileType {
  pacappi,
  pacappu;

  String get label {
    return switch (this) {
      PacapacaProfileType.pacappi => 'pacapaca.pacappi'.tr(),
      PacapacaProfileType.pacappu => 'pacapaca.pacappu'.tr(),
    };
  }

  String get value => name;
}
